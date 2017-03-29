Return-Path: <pidge@toganlabs.com>
Received: from egyptian.birch.relay.mailchannels.net
	(egyptian.birch.relay.mailchannels.net [23.83.209.56])
	by mail.openembedded.org (Postfix) with ESMTP id 6197077CDC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:32:33 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6BE7E7C199A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:32:32 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.128.152])
	by relay.mailchannels.net (Postfix) with ESMTPA id EAD927C2039
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:32:31 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.61.168])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Wed, 29 Mar 2017 13:32:32 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Society-Shoe: 31de6d482a78a7e0_1490794352232_2344297632
X-MC-Loop-Signature: 1490794352232:153816954
X-MC-Ingress-Time: 1490794352231
Received: from [213.46.252.136] (port=41842 helo=[192.168.229.56])
	by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>) id 1ctDiB-001Pgy-7x
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Mar 2017 15:32:31 +0200
Message-ID: <1490794348.15543.24.camel@toganlabs.com>
From: Beth 'pidge' Flanagan <pidge@toganlabs.com>
Reply-To: pidge@toganlabs.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 15:32:28 +0200
In-Reply-To: <1490794285-4010-1-git-send-email-pidge@toganlabs.com>
References: <1490794285-4010-1-git-send-email-pidge@toganlabs.com>
Organization: toganlabs.com
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pidge@toganlabs.com
Subject: Re: [PATCHv2] bitbake.conf: Add aws to HOSTTOOLS_NONFATAL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 13:32:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-03-29 at 15:31 +0200, Elizabeth 'pidge' Flanagan wrote:

Ignore, bad rebased commit msg.

-b

> This adds aws to HOSTTOOLS_NONFATAL in order to get the s3 fetcher
> working again. It also sets FETCHCMD_s3 for completions sake.
>=20
> Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
> ---
> =C2=A0meta/conf/bitbake.conf | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 96a9ed9..d95e39d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -469,7 +469,7 @@ HOSTTOOLS +=3D " \
> =C2=A0HOSTTOOLS +=3D "ip ping ps scp ssh stty"
> =C2=A0
> =C2=A0# Link to these if present
> -HOSTTOOLS_NONFATAL +=3D "ccache gcc-ar gpg ld.bfd ld.gold nc sftp
> socat sudo"
> +HOSTTOOLS_NONFATAL +=3D "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp
> socat sudo"
> =C2=A0
> =C2=A0# Temporary add few more detected in bitbake world
> =C2=A0HOSTTOOLS_NONFATAL +=3D "join nl size yes zcat"


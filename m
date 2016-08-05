Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id A325073CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 13:37:40 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 44BBBA003C9;
	Fri,  5 Aug 2016 15:37:42 +0200 (CEST)
Received: from [172.16.10.21] ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080515374057-23630 ;
	Fri, 5 Aug 2016 15:37:40 +0200 
To: "Burton, Ross" <ross.burton@intel.com>
References: <1470402935-5261-1-git-send-email-s.mueller-klieser@phytec.de>
	<CAJTo0LaEA7hroi6fgNrf_3z0MvL5ckBz3cu4YvUqcq7m1GGZpw@mail.gmail.com>
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
Organization: PHYTEC Messtechnik GmbH
Message-ID: <57A4969F.8020805@phytec.de>
Date: Fri, 5 Aug 2016 15:37:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaEA7hroi6fgNrf_3z0MvL5ckBz3cu4YvUqcq7m1GGZpw@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 05.08.2016 15:37:40,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 05.08.2016 15:37:40
X-TNEFEvaluated: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: fix installed-vs-shipped for bat
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
X-List-Received-Date: Fri, 05 Aug 2016 13:37:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05.08.2016 15:19, Burton, Ross wrote:
> On 5 August 2016 at 14:15, Stefan M=C3=BCller-Klieser <
> s.mueller-klieser@phytec.de> wrote:
>=20
>> +       if ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'false', 'true',
>> d)}; then
>>
>=20
> This means the script is installed if bat isn't selected, which I don't
> think you meant.

It seems I tricked myself when testing. I will send a v2.
Stefan

>=20
> Ross
>=20


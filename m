Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id C363A74197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 10:54:40 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so94021056igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 02:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hlL+nYbn7PxxePTN8NONKo83jmxTDfCUc7R+MApbgXk=;
	b=sSAeTW3LdskITCGdAqz9AE/aASG0Sg4UzV6OPkU+9xzWMyQA2bsqoxUkyS3eDOVP8b
	IZlntRNHWN1a9XIdHmoNIdeYFmypxOITVcruCMVr7qLsFCamxajpaSr/DoFr58tYQdQA
	dsLVAB00TaMMBPpWDMsxMfVUxHqd2faupRsASgXC/lqrqaG6BCB/TqvLNN1DXUXzOBLI
	NemFeJQeqF7vGkyDHAdzk5dgdl5Kz0JFppfUIQiIX13UfUhobfsa5629O1vtn9xEMIMJ
	41wFocK/msmz27rMhyz8BKsiyc9DNzWUuIRkXL7zW8viusjcU0Gta5anM07o5CBR/8Y0
	K8+A==
MIME-Version: 1.0
X-Received: by 10.50.112.99 with SMTP id ip3mr26674867igb.78.1447152881007;
	Tue, 10 Nov 2015 02:54:41 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Tue, 10 Nov 2015 02:54:40 -0800 (PST)
In-Reply-To: <CAJTo0LbJ-VExiBRNeeQgdZ0C=Ex8g6UUcVGyJbRnjRSmrvE++g@mail.gmail.com>
References: <1447114335-32437-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbJ-VExiBRNeeQgdZ0C=Ex8g6UUcVGyJbRnjRSmrvE++g@mail.gmail.com>
Date: Tue, 10 Nov 2015 11:54:40 +0100
Message-ID: <CALbNGRR0UC2bFJC6dh1qXa=5SS02ovoayRpDgm1H8WFWxiwo=g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glew: set correct version in our configuration
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
X-List-Received-Date: Tue, 10 Nov 2015 10:54:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 11:36 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 10 November 2015 at 00:12, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> -+AC_INIT([glew], [1.9.0], [BUG-REPORT-ADDRESS])
>> ++AC_INIT([glew], [1.12.0], [BUG-REPORT-ADDRESS])
>
>
> This is going to get tedious quickly, can we have a patch postfunc to sed=
 in
> the right version at build time?
>
> Ross
Right this need more love - V2 will follow

Andreas


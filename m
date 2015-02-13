Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE6860556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 17:36:44 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id kx10so20242294pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=4UTMihKRJNzQjhqAPzKc/APyDz4uKgbRwWH9jJPCde8=;
	b=bjNpidJRSz9mnA6LzWER5VYH2ryrw1P5opQ2UJv3hyKv9HmAMXNfx8H6TMKoQXu7PA
	SSHRnBoevj7sdmTQmmcJ9ndd0YmvnAkZRkgRxAp9oRCicyNcp3FLQ97Fsmx/eZFBlO4M
	VnmFHMC2DW6kZk+atza+gUdzCCNw6qpqocPb1z0BLLsP7yGuYyCVZGLOioQ+J7AHK4NM
	7+J+g27Zy4Q1XJ0c3LPzOvLkFB/leYGqz3dgt57vNssmpA4RCagm8B7eCkMjKVpTHv8m
	wwg8nOPxTUbddKZmS2C42N7CP4fVY/VxoUzSSTKzw2kXd7CWlJJqpKbABrzdI4nsihs3
	DSpQ==
MIME-Version: 1.0
X-Received: by 10.70.103.236 with SMTP id fz12mr7804579pdb.167.1423849006071; 
	Fri, 13 Feb 2015 09:36:46 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Fri, 13 Feb 2015 09:36:46 -0800 (PST)
In-Reply-To: <CAJTo0LYvo-TGVuVo1vu-b0FS+_i1UpnkZGYj1HXRyefFNZJkDg@mail.gmail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
	<1423807195-7087-6-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYvo-TGVuVo1vu-b0FS+_i1UpnkZGYj1HXRyefFNZJkDg@mail.gmail.com>
Date: Fri, 13 Feb 2015 18:36:46 +0100
Message-ID: <CALbNGRRyqtB8OxZqg+ovmAMgGWzrrt0tfHW4mqBR04_JX6XAeQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] liberation-fonts: update to 1.07.4
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
X-List-Received-Date: Fri, 13 Feb 2015 17:36:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2015 at 6:22 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 13 February 2015 at 05:59, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> * A bit of a test for fontforge-native
>
>
> Instead of needing to build another native package just to compile the
> fonts, why not just use the binary tarballs?
>
> Ross
to me fontforge-native was just a use-case. I need it for kde's oxygen
fonts and would like to have it on target too. So I'll try meta-oe -
if unsuccessful there put it back my layer. So forget 4-6 of this
series.

What about 1-3?

Andreas


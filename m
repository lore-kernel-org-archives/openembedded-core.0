Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C9CE760167;
	Sat, 14 Feb 2015 15:15:52 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z107so17550055qgd.5;
	Sat, 14 Feb 2015 07:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h8/xFKjtA4aVJkAVwIV2FE2z/lkuWzzx/Dk6jeMH/xQ=;
	b=BMPkFwRbu7JFI1zGMBRD7DZepj7X7k3J7tz+CS0RPZfNGawcktsM068BByauVbcTp3
	4dgLLFFtQHqC3PHNPA5ZmAuRpRptsHz089QFdmU9995wHw5nLCRuzdA6AjfDKRrUdax6
	Sa+pCBv49k+M3XmeA2tBVaWr4yRMs0pGYwrQ7VHhA6GmOufuUyr0kCCVo3YSSkqanuY2
	YstR1C9EBhwLR0DpCJjOy2B4DeN5qx1G0LZ8zkQY23MVOgNEXHVCEiG3Ub6VqD/28dcN
	EAWcFUpiCfQhdX5RaCrHfWndERldTBOxwH2CE5vQl2dBcz3/yfO8qqP5o9VwnaAtZS+Q
	CSmg==
MIME-Version: 1.0
X-Received: by 10.229.131.138 with SMTP id x10mr23780111qcs.25.1423926954004; 
	Sat, 14 Feb 2015 07:15:54 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Sat, 14 Feb 2015 07:15:53 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Sat, 14 Feb 2015 07:15:53 -0800 (PST)
In-Reply-To: <CAJTo0La6i2hDqPcZFjvrcPsRReNhirfsbOxD-_udJJDQ7YrKhw@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
	<1423908404.20217.100.camel@linuxfoundation.org>
	<CAJTo0La6i2hDqPcZFjvrcPsRReNhirfsbOxD-_udJJDQ7YrKhw@mail.gmail.com>
Date: Sat, 14 Feb 2015 09:15:53 -0600
Message-ID: <CACS+7ZTHKHN1cnKo0YvN03LBj5KRgH_MgDa5ZEquoZg6qruL4w@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: yocto@yoctoproject.org,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Sat, 14 Feb 2015 15:15:56 -0000
Content-Type: multipart/alternative; boundary=001a1133dde24795fc050f0dd4fe

--001a1133dde24795fc050f0dd4fe
Content-Type: text/plain; charset=UTF-8

On 14 Feb 2015 07:09, "Burton, Ross" <ross.burton@intel.com> wrote:
>
> Hi,
>
> On 14 February 2015 at 10:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
>>
>> Right now, poky-tiny failed due to warning are errors and unused
>> symbols. Minnow failed due to SSE instruction issues. Full build logs
>> are also available on the autobuilder:
>
>
> Now those SSE errors I thought were fixed - is this more of the same or
did I manage to drop a patch when merging?
>
> Ross
>

There are SSE errors that were fixed upstream post-release. I don't know if
that's what's affecting you, but they're not in these recipes.

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1133dde24795fc050f0dd4fe
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On 14 Feb 2015 07:09, &quot;Burton, Ross&quot; &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; On 14 February 2015 at 10:06, Richard Purdie &lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Right now, poky-tiny failed due to warning are errors and unused<br>
&gt;&gt; symbols. Minnow failed due to SSE instruction issues. Full build logs<br>
&gt;&gt; are also available on the autobuilder:<br>
&gt;<br>
&gt;<br>
&gt; Now those SSE errors I thought were fixed - is this more of the same or did I manage to drop a patch when merging?<br>
&gt;<br>
&gt; Ross<br>
&gt;</p>
<p dir="ltr">There are SSE errors that were fixed upstream post-release. I don&#39;t know if that&#39;s what&#39;s affecting you, but they&#39;re not in these recipes.</p>
<p dir="ltr">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
</p>

--001a1133dde24795fc050f0dd4fe--

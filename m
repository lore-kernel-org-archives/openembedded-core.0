Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id D4CCC6E304
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Mar 2014 18:27:04 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so4775283igb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Mar 2014 10:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TvGfqFGNLB/Qu0YLbxG5cHW9Bw4AXt2PH38w7MGZ1xY=;
	b=rAY0uZOnTTEFObfGK7ns6iIv0aUt7laz39ywpkYO7OhlfmZDwIXK2fxewh97y3huqz
	53ahCV24JaXfOwOJPo3gPmfpDUs0tCbgz1QNGVOs5xOSazJ70pMWj+YJ6jHN4BgaWxs9
	s8V+s3XF4STt6LsNi2exMSTJlEinojeHfR3BrHD2Zwv4o2uk3AuDBDpNi7Mzs/oBzfRz
	V8lzSiVQAEE6uympZEfeF9GxpTAxh2Bc4u1G9UUAG6BKdncg28M+L+qV2uut7U2MQrI1
	xHk+k60WcDEArjo8tyuWqWGE4HGFYRneH3xISyZckNob8UsvYwW7Do7hRW7My+MXHz2t
	COBQ==
MIME-Version: 1.0
X-Received: by 10.42.203.202 with SMTP id fj10mr2324440icb.51.1394303225149;
	Sat, 08 Mar 2014 10:27:05 -0800 (PST)
Received: by 10.50.224.136 with HTTP; Sat, 8 Mar 2014 10:27:04 -0800 (PST)
Received: by 10.50.224.136 with HTTP; Sat, 8 Mar 2014 10:27:04 -0800 (PST)
In-Reply-To: <531B02E6.6070509@freescale.com>
References: <1394199544-19668-1-git-send-email-cosmin.paraschiv@freescale.com>
	<CAMKF1sq_hMS_eeF=aV4YkY6EFZP7gVgjfyabVE4p35uT8uYGRA@mail.gmail.com>
	<531B02E6.6070509@freescale.com>
Date: Sat, 8 Mar 2014 10:27:04 -0800
Message-ID: <CAMKF1spa-4iVA91hJ2co1NcOFdprvUkusfpE0NS6hzg9MeCXcg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Build libatomic
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
X-List-Received-Date: Sat, 08 Mar 2014 18:27:07 -0000
Content-Type: multipart/alternative; boundary=20cf303bf56871bf4e04f41c84e0

--20cf303bf56871bf4e04f41c84e0
Content-Type: text/plain; charset=UTF-8

-Khem
On Mar 8, 2014 3:46 AM, "Cosmin Paraschiv" <cosmin.paraschiv@freescale.com>
wrote:
>
> On 3/8/2014 2:13 AM, Khem Raj wrote:
>>
>> On Fri, Mar 7, 2014 at 5:39 AM, Cosmin Paraschiv
>> <cosmin.paraschiv@freescale.com> wrote:
>>>
>>> GCC 4.8 includes a new runtime library, libatomic, which supports
>>> atomic operations not supported by hardware or the OS. Build it,
>>> so other packages can link against it, if needed.
>>
>> what all architectures did you test
>
>
> I have tested the patch on powerpc, powerpc64, i586, x86_64 and arm.

thanks for info

--20cf303bf56871bf4e04f41c84e0
Content-Type: text/html; charset=UTF-8

<p dir="ltr"></p>
<p dir="ltr">-Khem<br>
On Mar 8, 2014 3:46 AM, &quot;Cosmin Paraschiv&quot; &lt;<a href="mailto:cosmin.paraschiv@freescale.com">cosmin.paraschiv@freescale.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 3/8/2014 2:13 AM, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Mar 7, 2014 at 5:39 AM, Cosmin Paraschiv<br>
&gt;&gt; &lt;<a href="mailto:cosmin.paraschiv@freescale.com">cosmin.paraschiv@freescale.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; GCC 4.8 includes a new runtime library, libatomic, which supports<br>
&gt;&gt;&gt; atomic operations not supported by hardware or the OS. Build it,<br>
&gt;&gt;&gt; so other packages can link against it, if needed.<br>
&gt;&gt;<br>
&gt;&gt; what all architectures did you test<br>
&gt;<br>
&gt;<br>
&gt; I have tested the patch on powerpc, powerpc64, i586, x86_64 and arm.</p>
<p dir="ltr">thanks for info</p>

--20cf303bf56871bf4e04f41c84e0--

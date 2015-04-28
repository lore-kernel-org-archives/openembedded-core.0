Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id A8AF572277
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:08:21 +0000 (UTC)
Received: by iget9 with SMTP id t9so96963551ige.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yqtyYQLklQwyg7/Qx8frdmlXTs6UZIHttlb/8uLnX7c=;
	b=QEV/aeklS8sWLctT7lrEyJYJXsc5jCEuib+1OBYAu/bNlMr7tIj47n+5fXn7dO4Z31
	2K6AZVnNFwnDREC5z6jsEgNZwzgWjZ03Mvv3v2wcQ0vftUNh7tI8H5sqKMRhg4pNnGvm
	nE4cJKwE4XY97SD8WjZOtE2LUHwyvV0Vh56WKsOcMiAmUtFbab9C8X/2rh0BgIUB6AKn
	sKtCpXOd6JlyQKY1o9dgfmb0vWW3yPjHPQVaN+YVpc8TZ0xGLeF0C22zfd8wJ8RZVo9m
	FNKeTJasEJ7+P6WFcniWYB3bhs+HYxb2i86KKK0fh3y2jjpxfn6hMT5UpvnNr3CzEDRx
	EC7w==
MIME-Version: 1.0
X-Received: by 10.50.129.99 with SMTP id nv3mr3850507igb.30.1430258903327;
	Tue, 28 Apr 2015 15:08:23 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 15:08:23 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 15:08:23 -0700 (PDT)
In-Reply-To: <CANx9H-AQSAvAXvo0z_Dw3VzLNvku-vYju-UjaQ=ji=bo7cyaPw@mail.gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
	<73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
	<CANx9H-AQSAvAXvo0z_Dw3VzLNvku-vYju-UjaQ=ji=bo7cyaPw@mail.gmail.com>
Date: Tue, 28 Apr 2015 15:08:23 -0700
Message-ID: <CAMKF1so2nNsSYtLgZyuGaxtr_W3O_sFFbbUe_P_NVdFZ4FdW5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Tue, 28 Apr 2015 22:08:22 -0000
Content-Type: multipart/alternative; boundary=047d7b3a91e6deac6d0514d0196b

--047d7b3a91e6deac6d0514d0196b
Content-Type: text/plain; charset=UTF-8

On Apr 28, 2015 2:53 PM, "Tim Orling" <ticotimo@gmail.com> wrote:
>
>
> On Tue, Apr 28, 2015 at 8:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>> On Apr 28, 2015, at 8:25 AM, Tim Orling <ticotimo@gmail.com> wrote:
>>>
>>> The following branch includes updates to the latest releases for cogl,
clutter, wayland, weston and libinput:
>>>
>>>
http://git.openembedded.org/openembedded-core-contrib/log/?h=timo/cogl-clutter-wayland-weston-updates
>>>
>>> wayland and weston appear to be fine as tested on nuc.
>>
>>
>> I have had wayland/weston updates lying on my tree for some time now
>>
>>
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=eb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b
>>
>> tried git versions too
>>
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=992c13dcd4b79fe64f4f9b8122627f918257ccef
>>
>> There are problem with emulator with 1.7 and libinput I guess where the
mouse does not work
>> in qemux86 as well as qemux86-64, it works fine with 1.6, I have tested
all versions 0.8 and newer of lib input
>> for no success. That was the reason I did not propose those patches.
>>
>
> Khem -- I was not aware that 1.6 worked with qemux86 and qemux86-64. I
thought qemu had continued to be a non-starter :)
>

There is a hunk in my patches that enable needed backend for it to work on
qemux86
Please try it out

> I was also not aware that you had them in a tree... I was assuming nobody
had looked at the updates.
>
> Jussi --  I will take your suggestion for the udev location into account
for v2 if this goes any further.
>
> --Tim
>
> <snip>
>

--047d7b3a91e6deac6d0514d0196b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 28, 2015 2:53 PM, &quot;Tim Orling&quot; &lt;<a href=3D"mailto:ticot=
imo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Apr 28, 2015 at 8:46 AM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Apr 28, 2015, at 8:25 AM, Tim Orling &lt;<a href=3D"mailto:=
ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The following branch includes updates to the latest releases f=
or cogl, clutter, wayland, weston and libinput:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib/log/?h=3Dtimo/cogl-clutter-wayland-weston-updates">http://git.openembedd=
ed.org/openembedded-core-contrib/log/?h=3Dtimo/cogl-clutter-wayland-weston-=
updates</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; wayland and weston appear to be fine as tested on nuc.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I have had wayland/weston updates lying on my tree for some time n=
ow<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/c=
ommit/?h=3Dkraj/master&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b">h=
ttp://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/maste=
r&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b</a><br>
&gt;&gt;<br>
&gt;&gt; tried git versions too<br>
&gt;&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/c=
ommit/?h=3Dkraj/master&amp;id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef">h=
ttp://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/maste=
r&amp;id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef</a><br>
&gt;&gt;<br>
&gt;&gt; There are problem with emulator with 1.7 and libinput I guess wher=
e the mouse does not work<br>
&gt;&gt; in qemux86 as well as qemux86-64, it works fine with 1.6, I have t=
ested all versions 0.8 and newer of lib input<br>
&gt;&gt; for no success. That was the reason I did not propose those patche=
s.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Khem -- I was not aware that 1.6 worked with qemux86 and qemux86-64. I=
 thought qemu had continued to be a non-starter :)<br>
&gt;</p>
<p dir=3D"ltr">There is a hunk in my patches that enable needed backend for=
 it to work on qemux86<br>
Please try it out<br></p>
<p dir=3D"ltr">&gt; I was also not aware that you had them in a tree... I w=
as assuming nobody had looked at the updates.<br>
&gt;<br>
&gt; Jussi -- =C2=A0I will take your suggestion for the udev location into =
account for v2 if this goes any further.<br>
&gt;<br>
&gt; --Tim<br>
&gt;<br>
&gt; &lt;snip&gt;<br>
&gt;<br>
</p>

--047d7b3a91e6deac6d0514d0196b--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3F960110
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:20:07 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id n7so19334061iob.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xkog+46zrFTP0hrkN4WysUruFPzpN1kOtjKHr3znG/c=;
	b=Dy8yCDBCeQOtaCwXDL7hlNsSWw5Bi3YhTo6Eyp5tT221yMYm9l79FpRUe/Xy8XhkET
	nXlJbi0Q0BItjomx1McqhLEsFC+PVFGfR49YB77H05azIkZ1GoAIJs6yxVLNgsjY7FfA
	Y9ty3aow0M+3ImfUBFLjoTZPNf1zFdMQqc895UVT0PUeHAM4elhqffEHf/hjJbG4HGKu
	daH9+J3zmfyGSwdG8ayHGfR8sRsmvER6pLsRE3lU1iepmpUpiMFhacxN7h1h2WoNsduv
	9O857wQ5aswd3F9L4RuX8mCzU2Zt7ZaNPLp0TJHzYRF6te9Vk4tiPNy/C665KXGBk4OR
	+i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xkog+46zrFTP0hrkN4WysUruFPzpN1kOtjKHr3znG/c=;
	b=lANB1Hkr4V4d0KxBWKFxR1m4ZunKWIN9w96dYarHTAgAOH9vhiVdCi/sLzg/HTCWa9
	OKOpd0MMXv6id/hVb4XfPFyp0todKnv67m4+TsHWZO9MlMjBKPGpwLbWk0/CqQ7BZHyr
	6nHHvtD6giY3Cew69mVuL8G+eqqQ2CIddvy9ATbU5owfKMCejLrQIuGnfrMYxj249zQa
	SO3EdZyyWIAf6tH/H06tIW4pOTziH32dtwdi0ru8dYHrwJ97ZfJ4DjidfUjpSOwCED+I
	NwL1NN3badmT/bAuBo5AvRoSwxHmRV+Rmq9zMIxefgJ1SUt7lxbSbhANJq10/M6WFxJE
	XMWA==
X-Gm-Message-State: AKwxytecxUlC8xN5NDHwDqmJjgkBD4xW9cb9as0unjumxrswm+pXlaK1
	f2oPtWNc10O0YTMSYVN4zu+o0OCUMHbyNg6K7Ns8xg==
X-Google-Smtp-Source: AH8x225cOTSdFHoYAmL6mE/sE+GKdgGPYO8X1dBxtQFWFTbm9GUQMpWQt/H+/owN4BMvKFliLhWP5Oy6kn+HrjbmvuE=
X-Received: by 10.107.9.154 with SMTP id 26mr23786335ioj.52.1517494809402;
	Thu, 01 Feb 2018 06:20:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 06:19:49 -0800 (PST)
In-Reply-To: <5afe874c-31b5-65eb-0f10-939b4a271902@thecshore.com>
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
	<CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
	<e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
	<CAJTo0LZyLzYWAWcR7WUY+e9u2c=LhdqQg6WU2p8dCsB7umiv2A@mail.gmail.com>
	<05c5c737-f5e5-8215-01b9-f6a1ef744063@thecshore.com>
	<CAJTo0LY3xrYA4AK6OkBOCAn+CiO4PAuE9xLOmRAu9MUM3TYjwA@mail.gmail.com>
	<5afe874c-31b5-65eb-0f10-939b4a271902@thecshore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 14:19:49 +0000
Message-ID: <CAJTo0LZ1tDquYwyHzLjp7c4ft6Zg+Qbnz+5+EK1uX1BUosso1w@mail.gmail.com>
To: "Daniel F. Dickinson" <cshored@thecshore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding a "tiny" DISTRO_FEATURE and having packages build smaller
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
X-List-Received-Date: Thu, 01 Feb 2018 14:20:08 -0000
Content-Type: multipart/alternative; boundary="001a113ea2b61035160564274bd7"

--001a113ea2b61035160564274bd7
Content-Type: text/plain; charset="UTF-8"

On 1 February 2018 at 14:17, Daniel F. Dickinson <cshored@thecshore.com>
wrote:

> On 01/02/18 09:12 AM, Burton, Ross wrote:
>
>> On 1 February 2018 at 14:10, Daniel F. Dickinson <cshored@thecshore.com
>> <mailto:cshored@thecshore.com>> wrote:
>>
>>     On 01/02/18 08:54 AM, Burton, Ross wrote:
>>
>>         On 1 February 2018 at 13:44, Daniel F. Dickinson
>>         <cshored@thecshore.com <mailto:cshored@thecshore.com>
>>         <mailto:cshored@thecshore.com <mailto:cshored@thecshore.com>>>
>>
>>         wrote:
>>
>>              I guess the question is would it be useful to have a flag
>>         that chooses
>>              a 'typical' tinyness but can be overridden (I'm think here of
>>              avoiding having to specify huge numbers of PACKAGECONFIGs
>> for a
>>              typical tiny case, when really you want most of the 'normal'
>>              tinyness with some
>>              tweaks.  What I'm think is that "tiny" really should just
>>         change the
>>              defaults for PACKAGECONFIG etc, but like the defaults can
>>         be easily
>>              overridden.
>>
>>
>>         Well in the idiomatic way the default would be "all the things
>>         are on", so doing a "tiny" build would be just setting
>>         PACKAGECONFIG="".
>>
>>         When we're dealing with tiny configurations you can't really say
>>         "and this is what people will want", because that's precisely
>>         the problem: you don't know what someone else will want.
>>
>>         Ross
>>
>>     Fair enough.  Is there a way to distribute a set of package configs
>>     and/or package selections (can a packagegroup do packageconfig or
>>     does that need to be specified in a different scope (I'm still
>>     getting used to openembedded)).  "tiny" is a bad choice because it's
>>     too generic, but perhaps "meta-tiny-router" "meta-tiny-switch"
>>     "meta-tiny-home-device" etc would make sense as mini-layers that
>>     could take care of sane defaults for different use cases (assuming
>>     the work of splitting packages up more and appropriate tinification
>>     PACKAGECONFIGs are either submitted to the appropriate layer or
>>     bbappended in various layers)?
>>
>>
>> A distribution can set other recipe's PACKAGECONFIGs directly:
>>
>> PACKAGECONFIG_pn-recipename = "foo bar"
>>
>> And distributions are welcome to bundle groups of those into inc files
>> for the user to pull in as required at the distro level.
>>
>

> I wonder if it'd be useful to have some .inc's of this variety added and
> included (commented out) in the poky-tiny distro default local.conf?
>

Included and enabled if they make sense, sure.  poky-tiny is, like
everything poky-specific, just an example.

It already has one:

PACKAGECONFIG_remove_pn-opkg-utils = "python"

Ross

--001a113ea2b61035160564274bd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 February 2018 at 14:17, Daniel F. Dickinson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:cshored@thecshore.com" target=3D"_blank">csh=
ored@thecshore.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex">On 01/02/18 09:12 AM, Burton, Ross =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail-">
On 1 February 2018 at 14:10, Daniel F. Dickinson &lt;<a href=3D"mailto:csho=
red@thecshore.com" target=3D"_blank">cshored@thecshore.com</a> &lt;mailto:<=
a href=3D"mailto:cshored@thecshore.com" target=3D"_blank">cshored@thecshore=
.com</a>&gt;<wbr>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On 01/02/18 08:54 AM, Burton, Ross wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On 1 February 2018 at 13:44, Daniel F. Dickinso=
n<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:cshored@thecshore.com" ta=
rget=3D"_blank">cshored@thecshore.com</a> &lt;mailto:<a href=3D"mailto:csho=
red@thecshore.com" target=3D"_blank">cshored@thecshore.com</a>&gt;<br></spa=
n>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:cshored@thecshore.=
com" target=3D"_blank">cshored@thecshore.com</a> &lt;mailto:<a href=3D"mail=
to:cshored@thecshore.com" target=3D"_blank">cshored@thecshore.com</a>&gt;<w=
br>&gt;&gt;<div><div class=3D"gmail-h5"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 I guess the question is wou=
ld it be useful to have a flag<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 that chooses<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 a &#39;typical&#39; tinynes=
s but can be overridden (I&#39;m think here of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 avoiding having to specify =
huge numbers of PACKAGECONFIGs for a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 typical tiny case, when rea=
lly you want most of the &#39;normal&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 tinyness with some<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 tweaks.=C2=A0 What I&#39;m =
think is that &quot;tiny&quot; really should just<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 change the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 defaults for PACKAGECONFIG =
etc, but like the defaults can<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 be easily<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 overridden.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Well in the idiomatic way the default would be =
&quot;all the things<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 are on&quot;, so doing a &quot;tiny&quot; build=
 would be just setting<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG=3D&quot;&quot;.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 When we&#39;re dealing with tiny configurations=
 you can&#39;t really say<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;and this is what people will want&quot;, =
because that&#39;s precisely<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the problem: you don&#39;t know what someone el=
se will want.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ross<br>
<br>
=C2=A0 =C2=A0 Fair enough.=C2=A0 Is there a way to distribute a set of pack=
age configs<br>
=C2=A0 =C2=A0 and/or package selections (can a packagegroup do packageconfi=
g or<br>
=C2=A0 =C2=A0 does that need to be specified in a different scope (I&#39;m =
still<br>
=C2=A0 =C2=A0 getting used to openembedded)).=C2=A0 &quot;tiny&quot; is a b=
ad choice because it&#39;s<br>
=C2=A0 =C2=A0 too generic, but perhaps &quot;meta-tiny-router&quot; &quot;m=
eta-tiny-switch&quot;<br>
=C2=A0 =C2=A0 &quot;meta-tiny-home-device&quot; etc would make sense as min=
i-layers that<br>
=C2=A0 =C2=A0 could take care of sane defaults for different use cases (ass=
uming<br>
=C2=A0 =C2=A0 the work of splitting packages up more and appropriate tinifi=
cation<br>
=C2=A0 =C2=A0 PACKAGECONFIGs are either submitted to the appropriate layer =
or<br>
=C2=A0 =C2=A0 bbappended in various layers)?<br>
<br>
<br>
A distribution can set other recipe&#39;s PACKAGECONFIGs directly:<br>
<br>
PACKAGECONFIG_pn-recipename =3D &quot;foo bar&quot;<br>
<br>
And distributions are welcome to bundle groups of those into inc files for =
the user to pull in as required at the distro level.<br></div></div></block=
quote></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div>=
<div class=3D"gmail-h5">
</div></div></blockquote>
I wonder if it&#39;d be useful to have some .inc&#39;s of this variety adde=
d and included (commented out) in the poky-tiny distro default local.conf?<=
br>
</blockquote></div><br></div><div class=3D"gmail_extra">Included and enable=
d if they make sense, sure. =C2=A0poky-tiny is, like everything poky-specif=
ic, just an example.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">It already has one:</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">PACKAGECONFIG_remove_pn-opkg-utils =3D &quot=
;python&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113ea2b61035160564274bd7--

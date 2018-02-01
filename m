Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 91AE078434
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:13:06 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m11-v6so101692iti.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IjeLRj+Im8QaNCvAReQr67cggD/iXOEUWL+hrbsPgz4=;
	b=ZvVaLe0+0WTrPEXrwwzRI6kMlH0H14dR99cY2BN6uhB5o9sfVOUoVumpOiirv2ndZE
	S4j5v/huX1RYrRUUgg5HpC1nFSdpKOHKx8sjgdx0mBKiOFu++zM6I7J5n2zhIPnfUAoO
	WPcbn+14Iu8QUtqLJE4KnTOhn7tBygqH0WWDjpVyeDoBmvHnX/B7RaEJRamQv7+wavFe
	I0Je8OJJwadcxe0sULo6CfH6j4a5qSJ93qVg7VPCZ/JUFAWoto8qPBnORk5GTRfF2LWc
	BfL5o3WgtkocqPSj+asCGgzktFceN8AvDwThbYYnVp29S1ravuQQPgTTYc54jMXY4CdC
	yPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IjeLRj+Im8QaNCvAReQr67cggD/iXOEUWL+hrbsPgz4=;
	b=bgInn9oQ2hZp5PmdwA2yhEqcArDbIiehaUh+au/rm5KW5zhgybeUfYDme0fk1vMopo
	AzZjoaWCW1th2AAznQ1pSXhmoCYCxfDQzcfbPjMYhYzEHU0PSWGeCYhqn45j0Ms5l4O2
	jRZJQQPa54WFTiAQTFN022LHidv5Qnqc034ZGySgKKa+J/R4luNNodPICARm8XZMdYU7
	7852YTXg8ykLpuULFBFoKjQ7kuog6MDiEB2J0HAU4nduWdj0jEM6qF58/dnCEE9sBK0i
	LbbiXmmRpgT7tmVoHok2ouY8JvcACOtOoglQE2nub5xohPAs32TBgYfCQ+oPr2as7VwH
	3Mrw==
X-Gm-Message-State: AKwxyteWfhxDH23IItwUb3eGU38HKwa6eFXIIHKjFxWJuESGMvAsUwQz
	YxySmgBuFvJgizGCKyTlxgJwDJjBQuSGWCWv3DvZ9A==
X-Google-Smtp-Source: AH8x2252fEgKJ3747RDA+KZSmFU0J9X2xJwKvp8DS9EA2PmnhdqYAYIKWTZN2M3vCMNLx9mqeHtH6KC++6qzZLJOV2g=
X-Received: by 10.36.228.197 with SMTP id o188mr19080712ith.85.1517494387594; 
	Thu, 01 Feb 2018 06:13:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 06:12:46 -0800 (PST)
In-Reply-To: <05c5c737-f5e5-8215-01b9-f6a1ef744063@thecshore.com>
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
	<CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
	<e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
	<CAJTo0LZyLzYWAWcR7WUY+e9u2c=LhdqQg6WU2p8dCsB7umiv2A@mail.gmail.com>
	<05c5c737-f5e5-8215-01b9-f6a1ef744063@thecshore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 14:12:46 +0000
Message-ID: <CAJTo0LY3xrYA4AK6OkBOCAn+CiO4PAuE9xLOmRAu9MUM3TYjwA@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 Feb 2018 14:13:06 -0000
Content-Type: multipart/alternative; boundary="94eb2c1253d0ebf0d10564273109"

--94eb2c1253d0ebf0d10564273109
Content-Type: text/plain; charset="UTF-8"

On 1 February 2018 at 14:10, Daniel F. Dickinson <cshored@thecshore.com>
wrote:

> On 01/02/18 08:54 AM, Burton, Ross wrote:
>
>> On 1 February 2018 at 13:44, Daniel F. Dickinson <cshored@thecshore.com
>> <mailto:cshored@thecshore.com>> wrote:
>>
>>     I guess the question is would it be useful to have a flag that chooses
>>     a 'typical' tinyness but can be overridden (I'm think here of
>>     avoiding having to specify huge numbers of PACKAGECONFIGs for a
>>     typical tiny case, when really you want most of the 'normal'
>>     tinyness with some
>>     tweaks.  What I'm think is that "tiny" really should just change the
>>     defaults for PACKAGECONFIG etc, but like the defaults can be easily
>>     overridden.
>>
>>
>> Well in the idiomatic way the default would be "all the things are on",
>> so doing a "tiny" build would be just setting PACKAGECONFIG="".
>>
>> When we're dealing with tiny configurations you can't really say "and
>> this is what people will want", because that's precisely the problem: you
>> don't know what someone else will want.
>>
>> Ross
>>
>> Fair enough.  Is there a way to distribute a set of package configs
> and/or package selections (can a packagegroup do packageconfig or does that
> need to be specified in a different scope (I'm still getting used to
> openembedded)).  "tiny" is a bad choice because it's too generic, but
> perhaps "meta-tiny-router" "meta-tiny-switch" "meta-tiny-home-device" etc
> would make sense as mini-layers that could take care of sane defaults for
> different use cases (assuming the work of splitting packages up more and
> appropriate tinification PACKAGECONFIGs are either submitted to the
> appropriate layer or bbappended in various layers)?
>

A distribution can set other recipe's PACKAGECONFIGs directly:

PACKAGECONFIG_pn-recipename = "foo bar"

And distributions are welcome to bundle groups of those into inc files for
the user to pull in as required at the distro level.

Ross

--94eb2c1253d0ebf0d10564273109
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 February 2018 at 14:10, Daniel F. Dickinson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:cshored@thecshore.com" target=3D"_blank">csh=
ored@thecshore.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 01/02/18 08:54 AM,=
 Burton, Ross wrote:<span class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 1 February 2018 at 13:44, Daniel F. Dickinson &lt;<a href=3D"mailto:csho=
red@thecshore.com" target=3D"_blank">cshored@thecshore.com</a> &lt;mailto:<=
a href=3D"mailto:cshored@thecshore.com" target=3D"_blank">cshored@thecshore=
.com</a>&gt;<wbr>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 I guess the question is would it be useful to have a flag tha=
t chooses<br>
=C2=A0 =C2=A0 a &#39;typical&#39; tinyness but can be overridden (I&#39;m t=
hink here of<br>
=C2=A0 =C2=A0 avoiding having to specify huge numbers of PACKAGECONFIGs for=
 a<br>
=C2=A0 =C2=A0 typical tiny case, when really you want most of the &#39;norm=
al&#39;<br>
=C2=A0 =C2=A0 tinyness with some<br>
=C2=A0 =C2=A0 tweaks.=C2=A0 What I&#39;m think is that &quot;tiny&quot; rea=
lly should just change the<br>
=C2=A0 =C2=A0 defaults for PACKAGECONFIG etc, but like the defaults can be =
easily<br>
=C2=A0 =C2=A0 overridden.<br>
<br>
<br>
Well in the idiomatic way the default would be &quot;all the things are on&=
quot;, so doing a &quot;tiny&quot; build would be just setting PACKAGECONFI=
G=3D&quot;&quot;.<br>
<br>
When we&#39;re dealing with tiny configurations you can&#39;t really say &q=
uot;and this is what people will want&quot;, because that&#39;s precisely t=
he problem: you don&#39;t know what someone else will want.<br>
<br>
Ross<br>
<br>
</blockquote></span>
Fair enough.=C2=A0 Is there a way to distribute a set of package configs an=
d/or package selections (can a packagegroup do packageconfig or does that n=
eed to be specified in a different scope (I&#39;m still getting used to ope=
nembedded)).=C2=A0 &quot;tiny&quot; is a bad choice because it&#39;s too ge=
neric, but perhaps &quot;meta-tiny-router&quot; &quot;meta-tiny-switch&quot=
; &quot;meta-tiny-home-device&quot; etc would make sense as mini-layers tha=
t could take care of sane defaults for different use cases (assuming the wo=
rk of splitting packages up more and appropriate tinification PACKAGECONFIG=
s are either submitted to the appropriate layer or bbappended in various la=
yers)?<br></blockquote><div><br></div><div>A distribution can set other rec=
ipe&#39;s PACKAGECONFIGs directly:</div><div><br></div><div>PACKAGECONFIG_p=
n-recipename =3D &quot;foo bar&quot;</div><div><br></div><div>And distribut=
ions are welcome to bundle groups of those into inc files for the user to p=
ull in as required at the distro level.</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--94eb2c1253d0ebf0d10564273109--

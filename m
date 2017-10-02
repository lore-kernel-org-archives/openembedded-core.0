Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id A1C7E71951
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 12:03:10 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id g18so6967942itg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eKPh8PqFzzKPkSU3GTDbGazVzp/oIKGApXouKyvkd+w=;
	b=bKBNcYbvgRoQDYhzWtVN3HkSr3kOcW5h85i+UIRjdJhwuROl3H9qTWg9m3E5EQ9SWt
	klLympUccc6uUMTa6O9cAzD0lfxhxDY/9ZgGJz98G6QFhHI+fHB7SAEoBkRYLuog0vof
	HE6BF72FoxzWVBuxmUQZbYs+9slrKip3BH6TpXNFEmv5o96R0HcgqQ0idY8zJfG0Vnyz
	kbCZx25w7q4RDqdQN2C9CBjaLe8uCzaOk7S3zPzfZeAxeUPd/o98lUy7TxWPR8DGohzi
	SpOCz9WMycsvasDu3dQ0/qc6zD9HpN2zJ1hCcUqoPDLow4GgY6cdZMx0lPXXjIGwEolh
	SaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eKPh8PqFzzKPkSU3GTDbGazVzp/oIKGApXouKyvkd+w=;
	b=BnwKofAzy9YYs3gMInIVBytM03u/f5YvGmd86hTl0BnzgLAYGSQy+j6/6bL7mNdAwA
	/i7ugNHk63tX67caojCQaQo1jem4oZ+wsi5Lcx3seG7B9hZT9lo4tTqbDKuAHZFGCXXJ
	gFrTNKwTlzcrD7ZR0aFR6WmSb3kIG6UoIfLL4LBcm1m1GY1/omyW85MyxWyh4LWfMGJU
	ojS6Rf03bOQ/KWFUDDZDUH10xD2GODjg33lwiDp6AvfcbOfkzp/Oz2ohyZF+B9iWqFKt
	8WOaXcspTboBaZzVwGdS+sZFF+wJvTcZxh/s3X0Iq0LFMd3UYlHFWL1XbTAAuR+lsjw8
	GR9g==
X-Gm-Message-State: AMCzsaVn2POt5WTo/e9mFY+EMRkDGqzuuTW7l0CGMPGmmuqDvGfpAfF4
	Zs1uIVPGPq3gd4/7cwHhvVvAgTzSskRPS2K1FPqmew==
X-Google-Smtp-Source: AOwi7QB9dicT8yWoqVuTBC4fePIfahvEJPvW6CjOREF5+D588B288CmlIuRgtLXCtKTcav5jBWJdj/2u5mk0TtMHlo4=
X-Received: by 10.36.167.79 with SMTP id s15mr11335742iti.6.1506945791526;
	Mon, 02 Oct 2017 05:03:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 2 Oct 2017 05:02:51 -0700 (PDT)
In-Reply-To: <98853737-95db-371c-992a-decc361f58be@linux.intel.com>
References: <20170927191215.15752-1-alejandro.hernandez@linux.intel.com>
	<CAJTo0LZARrNgW0ULNmLgf7vgGAY9fw-T89Ox4LZkYN06hKnAmA@mail.gmail.com>
	<98853737-95db-371c-992a-decc361f58be@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Oct 2017 13:02:51 +0100
Message-ID: <CAJTo0Lb=Ea6bZFKqrXK8BCxY9QPMUttWjw3Y1qDvibaLS2w4gQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python-native: Build with ipv6 enabled
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
X-List-Received-Date: Mon, 02 Oct 2017 12:03:10 -0000
Content-Type: multipart/alternative; boundary="f403045fb21899a9fc055a8f282e"

--f403045fb21899a9fc055a8f282e
Content-Type: text/plain; charset="UTF-8"

I think that's probably the best option.  There's not a lot of network
operations done by native applications and the ones that are will fallback
to IPv4, so I'm not surprised it wasn't noticed.

Ross

On 27 September 2017 at 21:28, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Yes, I really didnt want to enable ipv6 as a DISTRO_FEATURES_NATIVE,
> because it would affect other packages,
>
> and since it was deleted back in April and no one has complained, I
> figured we didnt need to enable it for all of them,
>
> but can definitely do that as well.
>
> On 09/27/2017 02:46 PM, Burton, Ross wrote:
>
> On 27 September 2017 at 20:12, Alejandro Hernandez <
> alejandro.hernandez@linux.intel.com> wrote:
>
>> +# Enable ipv6 support for native by default, without having to modify
>> DISTRO_FEATURES_NATIVE
>>
>
> Or lets just change DISTRO_FEATURES_NATIVE?
>
> Ross
>
>
>

--f403045fb21899a9fc055a8f282e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think that&#39;s probably the best option.=C2=A0 There&#=
39;s not a lot of network operations done by native applications and the on=
es that are will fallback to IPv4, so I&#39;m not surprised it wasn&#39;t n=
oticed.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On 27 September 2017 at 21:28, Alejandro Hernande=
z <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.c=
om" target=3D"_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Yes, I really didnt want to enable ipv6 as a
      DISTRO_FEATURES_NATIVE, because it would affect other packages, <br>
    </p>
    <p>and since it was deleted back in April and no one has complained,
      I figured we didnt need to enable it for all of them,</p>
    <p>but can definitely do that as well.<br>
    </p><div><div class=3D"h5">
    <br>
    <div class=3D"m_-8040907798814805920moz-cite-prefix">On 09/27/2017 02:4=
6 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">On 27 September 2017 at 20:12, Alejandro Hernandez
        <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.i=
ntel.com" target=3D"_blank">alejandro.hernandez@linux.<wbr>intel.com</a>&gt=
;</span>
        wrote:<br>
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">+#
              Enable ipv6 support for native by default, without having
              to modify DISTRO_FEATURES_NATIVE<br>
            </blockquote>
            <div><br>
            </div>
            <div>Or lets just change DISTRO_FEATURES_NATIVE?</div>
            <div><br>
            </div>
            <div>Ross=C2=A0</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--f403045fb21899a9fc055a8f282e--

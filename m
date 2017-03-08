Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C5D9671A19
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 22:44:19 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g10so5888812wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 14:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f5nxgc2dy5W73nBnq3IR75tTTaXkCYLNd3dGTPzLHsE=;
	b=sNtxaukPZnAh/BClTDVye+TzQsZnHSutbKbGwePpKZitfifgiGA8T13KGG6RzOsTbb
	tbnfBB8gEVEroksG02lNNxh7GdyO9FNf40yZgQ4eeNnhB5a43kcB+EGcftEHryZBUWRo
	2k+jZaGBvbMf1t6jx0cijef7EfG2fuNVUevFbD/b7zF/kLD7mwon5MmCvFiPYsTNRF64
	VTCir0eTWOO9RW0XquYe5BB75JVTkiCPUuFw8afqB/waD3UQ1cpvpvtRoq4Jyg2mL5dH
	xCmOkTgPINFNCVTxPJziNZC24wqcOQrB7YLAhb0vyrhx1n/sURJvCwNLljO5Pq9rKCKs
	BkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f5nxgc2dy5W73nBnq3IR75tTTaXkCYLNd3dGTPzLHsE=;
	b=Q13Y8ZY2RIM+oZz3u0I9NfzDGJwVhztV4Ro9bSUCyvNOeJmogxVZEzUF5QQ4fzuCEF
	h9Tb91jibIXFja9uTeKHTpY1QcTv4DMbELQfRWFLwRKfKLOE4jse6FZ9CzQxJ2bd7w6d
	NHGx4e6utGdltKgXQxPQHWF/UoNCU9U0hDrbUlivvgPLQ2tfjwlJqnCSM73zD6N+8nha
	YlrQl+1EgtjwuhKmdM/JC+qJCtDf5pf9L5BmVP0gAD7RaJFxp7S2WrPphnqFa3PcBWE7
	92elhWZYPgs3YgRlTqc4j+TUkhvTVBO8zKpCFZ/oSoUjoff2qMnq1aF9F+tJVztkmJGZ
	sLVQ==
X-Gm-Message-State: AMke39kC4VX4p3aL6+uHnBfwMtExTGSjTF4yjkyn2w58Ok9urmhF7tf6dQMNzlcFzq6ecsiDL6j09tQHluwhfw==
X-Received: by 10.223.152.215 with SMTP id w81mr8353014wrb.151.1489013060598; 
	Wed, 08 Mar 2017 14:44:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Wed, 8 Mar 2017 14:44:20 -0800 (PST)
In-Reply-To: <CAJ86T=XEAnT+ZR4b2GLE_V+vQjRoXuv7Tn0_sQ5Cv14B4PoN2Q@mail.gmail.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=XEAnT+ZR4b2GLE_V+vQjRoXuv7Tn0_sQ5Cv14B4PoN2Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Mar 2017 14:44:20 -0800
Message-ID: <CAJ86T=XSzySy8kV__TbKXnMWr-2RGjGPsGjD-MxVJV_CXbnVEQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 22:44:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 8, 2017 at 12:54 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Mar 8, 2017 at 9:25 AM, Ross Burton <ross.burton@intel.com> wrote:
>> This class lets you use BBCLASSEXTEND to add a variant of the recipe that
>> fetches from git instead of a tarball.
>
> Looks good. This approach could perhaps also cover git -vs-
> externalsrc variants of a recipe, which seems to be a big topic for a
> lot of users.
>
>> For example:
>>
>>  BBCLASSEXTEND = "gitupstream:target"
>>  SRC_URI_class-gitupstream = "git://git.example.com/example"
>>  SRCREV_class-gitupstream = "abcd1234"
>>
>> This variant will have DEFAULT_PREFERENCE set to -1 so it needs to be selected
>> to be used
>
> So if I want to select the gitupstream variant, what should I set
> PREFERRED_VERSION to?
>
>>, and any git-specific tweaks can be done with the class-gitupstream
>> override, for example:
>>
>>  DEPENDS_append_class-gitupstream = " gperf-native"
>>
>>  do_configure_prepend_class-gitupstream() {
>>     touch ${S}/README
>>  }
>>
>> It currently only supports creating a git variant of the target recipe, not
>> native or nativesdk.  The BBCLASSEXTEND syntax (gitupstream:target) was chosen
>> so that support for native and nativesdk can be added at a later date.
>>
>> [ YOCTO #10215 ]
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/gitupstream.bbclass | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 meta/classes/gitupstream.bbclass
>>
>> diff --git a/meta/classes/gitupstream.bbclass b/meta/classes/gitupstream.bbclass
>> new file mode 100644
>> index 0000000..405283d
>> --- /dev/null
>> +++ b/meta/classes/gitupstream.bbclass
>> @@ -0,0 +1,25 @@
>> +CLASSOVERRIDE = "class-gitupstream"
>> +
>> +# TODO doesn't let you gitupstream a native recipe yet
>> +
>> +python gitupstream_virtclass_handler () {
>> +    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
>> +    if "gitupstream" not in (e.data.getVar('BBCLASSEXTEND', True) or ""):
>
> What's the significance of e.data.getVar() here -vs- d.getVar() below?

To answer my own question, this seems to be covered in the bitbake user manual:

"The global datastore is available as "d". In legacy code, you might
see "e.data" used to get the datastore. However, realize that "e.data"
is deprecated and you should use "d" going forward."

http://www.yoctoproject.org/docs/2.2.1/bitbake-user-manual/bitbake-user-manual.html#events

> (I ask because I've tried writing a few RecipePreFinalise event
> handlers and they don't always work quite as expected, so maybe I've
> been getting this wrong...).
>
>> +        bb.error("Don't inherit gitupstream, use BBCLASSEXTEND")
>> +        return
>> +
>> +    variant = d.getVar("BBEXTENDVARIANT", True)
>
> Maybe drop the ", True" ?
>
>> +    if variant not in ("target"):
>> +        bb.error("Pass the variant when using gitupstream, for example gitupstream:target")
>> +
>> +    d.setVar("DEFAULT_PREFERENCE", "-1")
>> +    d.setVar("S", "${WORKDIR}/git")
>> +
>> +    # Modify the SRCREV, if the recipe hasn't used PV_class-gitupstream to
>> +    # assign a +gitX PV already.
>> +    pv = d.getVar("PV", True)
>> +    if "+git" not in pv:
>> +        d.setVar("PV", pv + "+git${SRCPV}")
>> +}
>> +addhandler gitupstream_virtclass_handler
>> +gitupstream_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


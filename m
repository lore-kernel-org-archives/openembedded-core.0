Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 61C6D601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 08:20:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f126so164173331wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PfRVf9GGmGgQQJRvjdU6WNm75QwKKSoP5ZI5yY5SjQ8=;
	b=q2/riByDLyXTuIhZYVZIq0SYhdpuZ+v5lai2I7HqciGMW6CLFAVbIny1WWihM/TJ99
	lR5Q3K/5sQ5uIhhcfYsCyR3FERax8o/LNOa1jXOu718GwEvIWEqgJPA7Dw6n6kUsRdGt
	rWunJErreM0QUQDtIdzo8MiPGXdpUtrAZBqRI1lPQuyAfgCDY/93Zeiwury6GkYiE2Q4
	ztz0LoqJj2VvCQt9ZafVMtMuZ/6Xk9SkRDBVwFhZXi1eQcUM6ue44BF9OHMF97KAGzj0
	8SuES2ru/5zJib16oMb/rSdWBKWWIYFrWKFccV6nPKxvkwOSHGZ5h8vao5iyumcWYohU
	e7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PfRVf9GGmGgQQJRvjdU6WNm75QwKKSoP5ZI5yY5SjQ8=;
	b=Fbz2RXXtWK6tcOCwBizsuzeDHVTgwB7N4tcb/F4JitnSBYK7EVpa5jtGBT+kQZYhXY
	dDHbqJ+4ryMJ261T+KH3xhmSK1mCvzD9H14EVSIBP9L77qZAUE6OPxCNt1zbr3elXaii
	zw4k/P6pFttLILvLgbq/Aj44Wn45m6zRpKrPHLr14a0GRK+R3EedlVRTfGLoMCo23RYn
	/QICrN8zOql1ozozf6x8dQQ4UAgWEvKBm13cj2lygfwU3xdoBEN7SIBlM2pYaslmCPME
	guklufIztekgB9wEtDzO7tHyS3RHZgJjbLjqRkNishA5SZpasYGLlf2v/AUe3P7OhuIa
	0yBg==
X-Gm-Message-State: ALyK8tLECWRZHZWaoSoHXMImCPFieqjU6rgMer1oi1fLMQ1jO3M9ACkjdsTwWu/29FbL9C6YZjkWkjKacxdxaA==
X-Received: by 10.194.168.225 with SMTP id zz1mr21735734wjb.114.1467793256676; 
	Wed, 06 Jul 2016 01:20:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.47.69 with HTTP; Wed, 6 Jul 2016 01:20:56 -0700 (PDT)
In-Reply-To: <1467757624.8590.207.camel@linuxfoundation.org>
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
	<CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
	<CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
	<CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
	<1467757624.8590.207.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 6 Jul 2016 01:20:56 -0700
Message-ID: <CAJ86T=XjCQjTANa4g8ztdxQCRggGgn7QkYMa6Y1+3QTAOdSyjg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Wed, 06 Jul 2016 08:20:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 5, 2016 at 3:27 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-07-05 at 08:12 -0700, Khem Raj wrote:
>> On Tue, Jul 5, 2016 at 1:21 AM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>> > On Mon, Jul 4, 2016 at 8:58 AM, Burton, Ross <ross.burton@intel.com
>> > > wrote:
>> > >
>> > > On 4 July 2016 at 16:00, Andre McCurdy <armccurdy@gmail.com>
>> > > wrote:
>> > > >
>> > > > Say I have a proprietary library which only I can build from
>> > > > source
>> > > > and I have a conventional recipe which builds it within OE. I
>> > > > would
>> > > > now like to create a tar file of the library and headers etc,
>> > > > plus a
>> > > > companion recipe based on bin_package.bbclass to allow others
>> > > > to make
>> > > > use of the library in their OE builds. ie the situation
>> > > > described
>> > > > here:
>> > > >
>> > > > http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.ht
>> > > > ml#packaging-externally-produced-binaries
>> > > >
>> > > > Is there a recommended way to create the tar file to support
>> > > > that?
>> > > > e.g. a class which automatically creates a deployable tar file
>> > > > of a
>> > > > recipe's ${D} directory?
>> > >
>> > > You *may* be able to use package_tar in the recipe in some way to
>> > > achieve
>> > > this.
>> >
>> > It only seems to support creating tar files after packages have
>> > been
>> > split ( ie individual tar files for each subdirectory under
>> > ${WORKDIR}/packages-split ). I don't think it's going to be
>> > directly
>> > useful for creating a tar file of ${D}.
>>
>> package_tar is just another packaging format here so you will get
>> individual package separately
>> you might want to add another class to package everything into 1
>> thats
>> a separate issue, you have
>> to either add this via a bbclass or additional function
>
> Personally, I think that involving package_tar is likely going to
> overcomplicate this, as is packaging up the already separated out
> packages.
>
> Better to provide the output as do_install would leave it in ${D}, and
> then let packaging happen as the user has configured. Only tricky part
> would be the lack of source for the debugging symbols but if you can't
> release the source you'd want to "fix" that anyway.

I think the common case is that you wouldn't want to include source or
debug symbols, so using ${D} directly is still not perfect.

Here's the generate-prebuilt-tarfile.bbclass I'm currently using. It's
certainly not suitable for merging yet.

----

DEPLOY_DIR_PREBUILTS ?= "${DEPLOY_DIR}/prebuilts"

do_genprebuilt[depends] += "pbzip2-native:do_populate_sysroot"
do_genprebuilt[dirs] = "${DEPLOY_DIR_PREBUILTS}/${PACKAGE_ARCH} ${WORKDIR}"

do_genprebuilt() {

    if [ "${CLASSOVERRIDE}" != "class-target" ]; then
        exit 0
    fi

    TARFILE_BASENAME="$(echo ${PN}-prebuilt-${PV} | sed 's/AUTOINC+//')"

    tar --transform "s|^image|$TARFILE_BASENAME|" --owner 0 --group 0
-cvf - $(find image ! -type d | LC_ALL=C sort) | pbzip2 >
${DEPLOY_DIR_PREBUILTS}/${PACKAGE_ARCH}/$TARFILE_BASENAME.tar.bz2
}

addtask do_genprebuilt after do_install before do_populate_sysroot

----

> This way you don't need to worry if your tarball matches the users
> package configuration options (which backend, which packaging options
> etc.).
>
> Cheers,
>
> Richard
>
>


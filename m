Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.1131.1590255669225796964
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 10:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UVafW7lE;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: ptsneves@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id z5so16542723ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkw5MVUGKjDxir8O33odtmzyQGLM9PeWYZlidiMjjLo=;
        b=UVafW7lEqIgrtDn/N3kzh5XHhGm+0hwWL6g+FBJgH7QyBHXGA+kj46oIOxMvXmgT1i
         dwFxrTdMvkxEZPnbDES6Q3xq/3gOYzepvN42KPVidPlJAZ8J8vFawjlOKksU8yrxRGQf
         ZBmDmYxQFQPkzmX2iAGZTGI5RbF7zD6iaJ82v5hp5KymsK+ix7W8KQjlksDiYl0OQ+qU
         62q6EEDDrM1vLzXVKYEH5JxQKWw2lUqhuZXDFchMgDZ5kJyw14X6CSkVwaqAY4MfR1mL
         HUFNhaLJAw+NNptnuIPOGK7iMT7j7QJzvenjKtnUdKHOIeSkuYQGYy3TZjooc2f4SY1U
         gqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkw5MVUGKjDxir8O33odtmzyQGLM9PeWYZlidiMjjLo=;
        b=G14HHHkxkU032FnbxN/80BgYw6XzELmdNCWo/4nyvlkt155ZCeiBaZ/cCoZZJz4VOJ
         tmHinrUX9FRAbEYZ3yM9x4ObBP/Ax33J7izAO+gUlionWZjlbPeXuyk5iZK/y4bNaS2o
         1zg8WpEL0I7Oaz3zQA+57aBGg+rVfqyGu5T2NeX6SIFjgtu4gQtjGMtbKLK+leAxHkvC
         pipBxZuhu6FGkzK6WDXgQlHvrf3an6ni/gpkjRSSK2VfgmXvcqsV3qrwZ9+elPqoyq+L
         ZUS5ohOBv4PtA1frYgV3r7gKpe7MaUPy+jwmsvE1bGq832fXZBuEnxVBnXni6gFVnz95
         y/eg==
X-Gm-Message-State: AOAM532Yf+E1J1hubzEipHLrLlnXvuBBgVTIJqn055crrii7mvUZ77C7
	BHRZ9fShK4sf20i+UmBu35wkt0FryxOxculzGQ==
X-Google-Smtp-Source: ABdhPJzoYZhYUV98THjeYucKrpWHkWYNOEytO8YJA0TW/Ims9YlZBABzcvM9Pl1Ul7gaWhm6pMc68j1xn8Mcr4S9398=
X-Received: by 2002:a17:906:8694:: with SMTP id g20mr13176671ejx.75.1590255667653;
 Sat, 23 May 2020 10:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200522151335.7918-1-ptsneves@gmail.com> <20200522151335.7918-2-ptsneves@gmail.com>
 <CANNYZj9tpQRb95FX5ch47eH66f8xvr-EybMkmg1UsAxAHwqyfw@mail.gmail.com>
 <CAJO0J4gz9zz9iZ4EbrPvs7aVjT3Ro1WXhmwsb7izst2m=GLQSg@mail.gmail.com>
 <CALpKvHoR5OvUqaDXa0OdxMgpoDKAQNG9NM9pYa=cW9cL1J86TA@mail.gmail.com>
 <CAJO0J4hP71_27HDY7yoVR267TtppDp0jnYqQ1z61g5dBaTZX7Q@mail.gmail.com> <CALpKvHopa4WVbvJcm6ahnrn64_SZHi=dKZtZ6V05uaXq1eMMyA@mail.gmail.com>
In-Reply-To: <CALpKvHopa4WVbvJcm6ahnrn64_SZHi=dKZtZ6V05uaXq1eMMyA@mail.gmail.com>
From: "Paulo Neve" <ptsneves@gmail.com>
Date: Sat, 23 May 2020 19:40:56 +0200
Message-ID: <CAJO0J4jZ3Q4ymoSUs0oVV=mZhHOLE_tFr1HTYpgSXc5m7w+2gA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] 2/2] package_{ipk, deb, rpm}.bbclass: support per package user-defined metadata.
To: Michael Ho <michael.ho@ieee.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I was in the middle of making a test set based on Alexander suggestion
but it seems i need to redo all my workspace every time i run the
tests, which is terrible for iteration. Am i missing something?

oe-selftest -r package.PackageTests.test_custom_metadata_is_in_package_indexcd
../poky-selftest-st/
2020-05-22 23:27:52,286 - oe-selftest - ERROR - Not found
package.PackageTests.test_custom_metadata_is_in_package_indexcd in
loaded test cases

On Fri, May 22, 2020 at 9:31 PM Michael Ho <michael.ho@ieee.org> wrote:
>
> Hi Paulo,
>
> Yes, this is handled by the bitbake data handlers automatically. You can check this by trying the following:
>
> python do_test() {
>     d.setVar("HELLO", "world!")
>     d.setVar("HELLO_space", "space!")
>     bb.warn("HELLO: %s" % d.getVar("HELLO", True))
>     d.setVar("OVERRIDES", "space")
>     bb.warn("HELLO: %s" % d.getVar("HELLO", True))
> }
> addtask test
>
> Then calling this task with bitbake:
>
> $ bitbake zip -c test | tee
> ...
> WARNING: zip-3.0-r2 do_test: HELLO: world!
> WARNING: zip-3.0-r2 do_test: HELLO: space!
>
> I don't know the code or tests in oe that implement this functionality off the top of my head so I can't point you to the oe.selftest coverage.
>
> Kind regards,
> Michael
>
> On Fri, May 22, 2020 at 8:09 PM Paulo Neves <ptsneves@gmail.com> wrote:
>>
>> Hello Michael,
>>
>> The behavior you describe is indeed what i wanted. If you say this is
>> already working then my patches are redundant. Even so i am surprised
>> it is working. Is it done automatically by the getVar function?
>>
>> def get_package_additional_metadata (pkg_type, d):
>>     base_key = "PACKAGE_ADD_METADATA"
>>     for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
>>         if d.getVar(key, False) is None:
>>             continue
>>         d.setVarFlag(key, "type", "list")
>>         if d.getVarFlag(key, "separator") is None:
>>             d.setVarFlag(key, "separator", "\\n")
>>         metadata_fields = [field.strip() for field in
>> oe.data.typed_value(key, d)]
>>         return "\n".join(metadata_fields).strip()
>>
>> From my understanding, i do not see how the per package override
>> happens. Do you have the test for this functionality in oe-selftest?
>>
>> Grateful for the feedback
>> Paulo Neves
>>
>> On Fri, May 22, 2020 at 8:00 PM Michael Ho <michael.ho@ieee.org> wrote:
>> >
>> > Hi Paulo,
>> >
>> > I actually have some patches in my "to send upstream list" to address the documentation and some sstate-caching bugs with these variables so it's fresh to me at the moment.
>> > Correct me if I'm wrong but I think this is already available in the code (applying metadata specific to a certain package in a recipe, that is).
>> >
>> > eg. http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_ipk.bbclass at line 72 sets the local overrides so if PACKAGE_ADD_METADATA_IPK_xxx is set, it overrides PACKAGE_ADD_METADATA_IPK.
>> >
>> > For rpm, see
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n298 where the recipe wide variable is fetched
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n338 where the local override is also set
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n354 where the package specific variables are fetched
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n436 where the package specific variables are applied to rpm packages
>> >
>> > I tested the zip recipe by applying these two lines:
>> > PACKAGE_ADD_METADATA_RPM = "Vendor: None"
>> > PACKAGE_ADD_METADATA_RPM_zip-dbg = "Vendor: Not you!"
>> > and could see differing results in the two rpm files produced.
>> >
>> > I think this covers the use case you're showing in your patches already, what do you think?
>> >
>> > Kind regards,
>> > Michael
>> >
>> > (sorry if this shows up as a triple email, my mail client wasn't cooperating).
>> >
>> > On Fri, May 22, 2020 at 5:29 PM Paulo Neve <ptsneves@gmail.com> wrote:
>> >>
>> >> Is ./meta/lib/oeqa/selftest/cases/package.py the right place?
>> >> If yes i can work on it. Note that this functionality is not used
>> >> anywhere in poky and is not documented at all. It just happened to
>> >> exist for a long time and be useful for my case.
>> >>
>> >> On Fri, May 22, 2020 at 5:22 PM Alexander Kanavin
>> >> <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > Should there be a test for this functionality? Somewhere in oe-selftest perhaps where various package manager features are tested?
>> >> >
>> >> > Alex
>> >> >
>> >> > On Fri, 22 May 2020 at 17:13, Paulo Neve <ptsneves@gmail.com> wrote:
>> >> >>
>> >> >> Up to now the user defined metadata was set recipe wide,
>> >> >> meaning all the packages generated in a recipe where the
>> >> >> variable was set would get the same metadata. That is not
>> >> >> always ideal and is counter to the per package control that
>> >> >> is usually available.
>> >> >>
>> >> >> Keep support for package agnostic metadata but also add option
>> >> >> to add it to a specific option like:
>> >> >> PACKAGE_ADD_METADATA_${PN}_IPK = "mymeta: myvalue"
>> >> >>
>> >> >> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> >> >> ---
>> >> >>  meta/classes/package.bbclass     | 4 ++--
>> >> >>  meta/classes/package_deb.bbclass | 2 +-
>> >> >>  meta/classes/package_ipk.bbclass | 2 +-
>> >> >>  meta/classes/package_rpm.bbclass | 5 +++--
>> >> >>  4 files changed, 7 insertions(+), 6 deletions(-)
>> >> >>
>> >> >> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> >> >> index 0b5cf47749..1678e0d794 100644
>> >> >> --- a/meta/classes/package.bbclass
>> >> >> +++ b/meta/classes/package.bbclass
>> >> >> @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d, depversions=None):
>> >> >>
>> >> >>      return pkg
>> >> >>
>> >> >> -def get_package_additional_metadata (pkg_type, d):
>> >> >> +def get_package_additional_metadata (pkg_type, pkg_name, d):
>> >> >>      base_key = "PACKAGE_ADD_METADATA"
>> >> >> -    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
>> >> >> +    for key in ("%s_%s" % (base_key, pkg_type.upper()), "%s_%s_%s" % (base_key, pkg_name, pkg_type.upper()), base_key):
>> >> >>          if d.getVar(key, False) is None:
>> >> >>              continue
>> >> >>          d.setVarFlag(key, "type", "list")
>> >> >> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
>> >> >> index 790b26aef2..6ef9c8cb3a 100644
>> >> >> --- a/meta/classes/package_deb.bbclass
>> >> >> +++ b/meta/classes/package_deb.bbclass
>> >> >> @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):
>> >> >>
>> >> >>          # more fields
>> >> >>
>> >> >> -        custom_fields_chunk = get_package_additional_metadata("deb", localdata)
>> >> >> +        custom_fields_chunk = get_package_additional_metadata("deb", pkgname, localdata)
>> >> >>          if custom_fields_chunk:
>> >> >>              ctrlfile.write(custom_fields_chunk)
>> >> >>              ctrlfile.write("\n")
>> >> >> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
>> >> >> index c008559e4a..f78cec7a70 100644
>> >> >> --- a/meta/classes/package_ipk.bbclass
>> >> >> +++ b/meta/classes/package_ipk.bbclass
>> >> >> @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):
>> >> >>              else:
>> >> >>                  ctrlfile.write(c % tuple(pullData(fs, localdata)))
>> >> >>
>> >> >> -        custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
>> >> >> +        custom_fields_chunk = get_package_additional_metadata("ipk", pkgname, localdata)
>> >> >>          if custom_fields_chunk is not None:
>> >> >>              ctrlfile.write(custom_fields_chunk)
>> >> >>              ctrlfile.write("\n")
>> >> >> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>> >> >> index 9145717f98..ab019192da 100644
>> >> >> --- a/meta/classes/package_rpm.bbclass
>> >> >> +++ b/meta/classes/package_rpm.bbclass
>> >> >> @@ -295,7 +295,6 @@ python write_specfile () {
>> >> >>      srcmaintainer  = d.getVar('MAINTAINER')
>> >> >>      srchomepage    = d.getVar('HOMEPAGE')
>> >> >>      srcdescription = d.getVar('DESCRIPTION') or "."
>> >> >> -    srccustomtagschunk = get_package_additional_metadata("rpm", d)
>> >> >>
>> >> >>      srcdepends     = d.getVar('DEPENDS')
>> >> >>      srcrdepends    = []
>> >> >> @@ -333,6 +332,8 @@ python write_specfile () {
>> >> >>          pkgname = localdata.getVar('PKG_%s' % pkg)
>> >> >>          if not pkgname:
>> >> >>              pkgname = pkg
>> >> >> +
>> >> >> +        srccustomtagschunk = get_package_additional_metadata("rpm", pkgname, d)
>> >> >>          localdata.setVar('PKG', pkgname)
>> >> >>
>> >> >>          localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
>> >> >> @@ -351,7 +352,7 @@ python write_specfile () {
>> >> >>          splitlicense = (localdata.getVar('LICENSE') or "")
>> >> >>          splitsection = (localdata.getVar('SECTION') or "")
>> >> >>          splitdescription = (localdata.getVar('DESCRIPTION') or ".")
>> >> >> -        splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
>> >> >> +        splitcustomtagschunk = get_package_additional_metadata("rpm", pkgname, localdata)
>> >> >>
>> >> >>          translate_vers('RDEPENDS', localdata)
>> >> >>          translate_vers('RRECOMMENDS', localdata)
>> >> >> --
>> >> >> 2.20.1
>> >> >>
>> >> >>
>> >> 

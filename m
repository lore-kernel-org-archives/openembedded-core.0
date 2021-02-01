Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.41024.1612210901747594090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 12:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=grcgRr2L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q7so18017445wre.13
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 12:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C17QPzcvh236iVL8CpBEn6nN23lhaWDTnlp/s9pDEf0=;
        b=grcgRr2L8udtNCd11rws4/QDbf6kwLG1H/WQNgrZDdW7Tis8Y2HSAK+PFfe/ahZ/Rj
         d/icoLk8F367DqhzeUae0jvC1R2j+tIBJacgR2ooT/Fvq34A3TEu+N973IKwV3j++pwJ
         zKbJjCQ75rwc7c6H/SXEwhlKQI0uOw6vnUD6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C17QPzcvh236iVL8CpBEn6nN23lhaWDTnlp/s9pDEf0=;
        b=dulZ3BkDuEZi4hk8iHDO6wZOVmrVILZr++TU+0ShbQqKEav5rFEYZFPcsSp0DkBtoV
         jwlJVNpJRx1uCQiDwSxLerMqitaaS+D1XZE2yhJ3IQwbDxsoAH0AayJoY+D92p2Rqntp
         5R28SfwLhnk/FakhFonR2qtsxDIEM0s5v3RbUDXi6SHu4X9dcHeNZePL/+i5dwt0pMp4
         T/jEmj5Qc7xllQWx+5CUwgaCPRIMWXxTAwdPBxzvbwjqp2EMm4kqQC4w1/jqAqeWwnXn
         qTviaBWdwn69VCLvHi5CzjncBLTiyuHPQs/zGXSpVCGQlKC5afT7SR/ONL2E1OyvJW4I
         0nDQ==
X-Gm-Message-State: AOAM530WrkNFFo0I0+0A9kc2NdWYVZr4IDpZ7mBOYThw4dWSnTw4U7zg
	DodlXDHcurQEY5EsAR7DrhGaag==
X-Google-Smtp-Source: ABdhPJx37VWc/w8j5Mom2qaKdqbeZSV3aXIIu3IpTZsjQpkvF79yY64+jqTqclc2V6wCPNdyYk5YiA==
X-Received: by 2002:adf:cf04:: with SMTP id o4mr20021079wrj.412.1612210899666;
        Mon, 01 Feb 2021 12:21:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ffbf:3082:adb4:3ffa? ([2001:8b0:aba:5f3c:ffbf:3082:adb4:3ffa])
        by smtp.gmail.com with ESMTPSA id j17sm349158wmc.28.2021.02.01.12.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 12:21:38 -0800 (PST)
Message-ID: <00626d6958d579647798adac8c3499b21584d701.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Joshua Watt
 <JPEW.hacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Feb 2021 20:21:35 +0000
In-Reply-To: <20210131131023.2oor4o3nmhhg3gxi@jama>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
	 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
	 <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
	 <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
	 <20210131095518.iqqi2lrx7n5b2csp@jama>
	 <1af99424085f84d64915e6251cc809ac450b8b0f.camel@linuxfoundation.org>
	 <20210131131023.2oor4o3nmhhg3gxi@jama>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-01-31 at 14:10 +0100, Martin Jansa wrote:
> On Sun, Jan 31, 2021 at 10:34:48AM +0000, Richard Purdie wrote:
> > Its the first time I've heard a report of that and it sounds a little
> > worrying. What you say stuck, bitbake hangs? Is it using cpu? A process
> > tree of what it looks like when stuck would be interesting if it is
> > hanging and maybe the last things in any running or just finished task
> > logs. It could be some issue with the way a failing task is handled?
> > 
> > We've seen a lot of weird issues on the autobuilder but not that. Could
> > you have something enabled in your setup for logging/reporting whch
> > wouldn't be in ours and could be causing it?
> 
> It doesn't seem to happen very often and I guess autobuilder doesn't
> include meta-python2 (which is currently the only reproducer in my list
> of layers).

We don't use meta-python2 on the autobuilder so that could explain why
we've not seen this.

> I've tried to reproduce it with just 3 layers included:
> BBLAYERS = " \
>   /OE/build/oe-core/meta-python2 \
>   /OE/build/oe-core/meta-openembedded/meta-oe \
>   /OE/build/oe-core/openembedded-core/meta \
> "
> 
> and it happened on 3rd try (cache, tmpdir, sstate-cache were removed
> only before 1st try)
> 
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> Loading cache: 100% |                                                                                                                                                                                                                                  | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb                                                                                                                                       | ETA:  0:00:14
> 
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> Loading cache: 100% |###################################################################################################################################################################################################################################| Time: 0:00:00
> Loaded 845 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-native_2.7.18.bb: Error executing a python function in <code>:                                                                                                                     | ETA:  0:01:10
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 14, function: <module>
>      0010:__anon_35__OE_build_oe_core_openembedded_core_meta_classes_devshell_bbclass(d)
>      0011:__anon_151__OE_build_oe_core_openembedded_core_meta_classes_sstate_bbclass(d)
>      0012:__anon_20__OE_build_oe_core_openembedded_core_meta_classes_blacklist_bbclass(d)
>      0013:__anon_177__OE_build_oe_core_openembedded_core_meta_classes_siteinfo_bbclass(d)
>  *** 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb(d)
> File: '/OE/build/oe-core/meta-python2/recipes-devtools/python/python-native_2.7.18.bb', lineno: 76, function: __anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb
>      0072:        manifest_file.seek(json_start)
>      0073:        manifest_str = manifest_file.read()
>      0074:        python_manifest = json.loads(manifest_str)
>      0075:
>  *** 0076:    rprovides = d.getVar('RPROVIDES').split()
>      0077:
>      0078:    # Hardcoded since it cant be python-native-foo, should be python-foo-native
>      0079:    pn = 'python'
>      0080:
> Exception: AttributeError: 'NoneType' object has no attribute 'split'

This sounds like a similar issue to the one I fixed in the python3
recipe:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cff7db890cdfab41cc8f74e3dc378660d9b6219e

> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-native_2.7.18.bb                                                                                                                                           | ETA:  0:00:30

Which makes me wonder whether the real issue is a bug in bitbake when
parsing fails. We did have an issue like that a while back but I
thought it was fixed by changes both Joshua and I made.


> Summary: There were 4 ERROR messages shown, returning a non-zero exit code.
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> Loading cache: 100% |###################################################################################################################################################################################################################################| Time: 0:00:00
> Loaded 1289 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb                                         
> 
> and here it's stuck for around 1 hour, bitbake using very little cpu.
> 
> martin@jama:~$ ps aux | grep bitbake
> martin    372784  0.0  0.0  11552   884 pts/1    S+   13:43   0:00 grep --color=auto bitbake
> martin    928962  0.1  0.1 219204 133704 ?       Sl   12:42   0:04 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    943698  0.0  0.0 119900 29928 pts/8    Sl+  12:43   0:01 python3 /OE/build/oe-core/bitbake/bin/bitbake -k python-native
> martin    945507  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945528  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945532  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945563  0.0  0.0 214364 124732 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945577  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945621  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945632  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945643  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945653  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945669  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945685  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945703  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945736  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945753  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945774  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945778  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945819  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945839  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945860  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945878  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945894  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945909  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945915  0.0  0.0 214364 124804 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945929  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945950  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945953  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945964  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945966  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    945989  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946005  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946016  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946037  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946038  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946064  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946068  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946080  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946103  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946109  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946122  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946135  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946137  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946152  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946167  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946168  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946185  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946197  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946214  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946228  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946243  0.0  0.0 214364 124728 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946249  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946265  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946298  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946345  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946364  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946386  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946389  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946405  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946410  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946442  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946458  0.0  0.0 214364 124612 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946463  0.0  0.0 214364 124652 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946481  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946501  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin    946518  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0

Something is wrong here as bitbake shouldn't have this number of
processes like this :(

> martin@jama:~$ sudo strace -p 928962
> strace: Process 928962 attached
> wait4(945507, 
> 
> martin@jama:~$ kill 928962
> 
> adds an warning to the stuck build:
> 
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> Loading cache: 100% |###################################################################################################################################################################################################################################| Time: 0:00:00
> Loaded 1289 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb                                                                                                                                       | ETA:  0:00:50
> WARNING: Cooker received SIGTERM, shutting down...
> 
> killing the main process:
> martin@jama:~$ kill 943698
> 
> terminates the stuck build, but all bitbake-server processes are left behind.
> 
> If I try to kill all remaining bitbake-server processes, then only one is left behind:
> martin    928962  0.1  0.1 285004 137688 ?       S    12:42   0:05 bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None None 0
> martin@jama:/OE/build/oe-core$ sudo strace -p 928962
> strace: Process 928962 attached
> select(7, [6], [], [], {tv_sec=0, tv_usec=40768}) = 0 (Timeout)
> poll([{fd=7, events=POLLIN}], 1, 0)     = 0 (Timeout)
> poll([{fd=8, events=POLLIN}], 1, 0)     = 0 (Timeout)
> select(7, [6], [], [], {tv_sec=0, tv_usec=100000}) = 0 (Timeout)
> poll([{fd=7, events=POLLIN}], 1, 0)     = 0 (Timeout)
> poll([{fd=8, events=POLLIN}], 1, 0)     = 0 (Timeout)
> 
> and then it dies as well after a while.

It sounds like the failed parsing is causing the parsing pool to fail
to clean up properly and its hanging at exit. I don't know why :(

> Here is bitbake-cookerdaemon.log, but doesn't look very interesting to me:

You're right, nothing looked untoward there to me either.

> 
> It was reproduced on builder with 64 cores.
> 
> After changing BB_NUMBER_PARSE_THREADS from default 64 to 10, I
> wasn't able to get bitbake stuck again (in the same setup after
> cleaning cache, tmpdir, sstate again) by calling "bitbake python-
> native" 20+ times.
> 
> But after changing BB_NUMBER_PARSE_THREADS to 100 I wasn't able to
> reproduce it again (so maybe 3rd try with the default value was just
> me being lucky to reproduce it).

I think after a certain number of tries, its not hitting the magic
combination where the parse failure breaks the parsing pool.


> 
> Then I've tried to change it to 1000, just to see what happens and it got stuck (but probably from different reasons):
> 
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> Loading cache: 100% |                                                                                                                                                                                                                                  | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-native_2.7.18.bb: Error executing a python function in <code>:                                                                                                                    | ETA:  --:--:--
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: '<code>', lineno: 14, function: <module>
>      0010:__anon_35__OE_build_oe_core_openembedded_core_meta_classes_devshell_bbclass(d)
>      0011:__anon_151__OE_build_oe_core_openembedded_core_meta_classes_sstate_bbclass(d)
>      0012:__anon_20__OE_build_oe_core_openembedded_core_meta_classes_blacklist_bbclass(d)
>      0013:__anon_177__OE_build_oe_core_openembedded_core_meta_classes_siteinfo_bbclass(d)
>  *** 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb(d)
> File: '/OE/build/oe-core/meta-python2/recipes-devtools/python/python-native_2.7.18.bb', lineno: 76, function: __anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb
>      0072:        manifest_file.seek(json_start)
>      0073:        manifest_str = manifest_file.read()
>      0074:        python_manifest = json.loads(manifest_str)
>      0075:
>  *** 0076:    rprovides = d.getVar('RPROVIDES').split()
>      0077:
>      0078:    # Hardcoded since it cant be python-native-foo, should be python-foo-native
>      0079:    pn = 'python'
>      0080:
> Exception: AttributeError: 'NoneType' object has no attribute 'split'

This one is one of the original errors above and can be fixed with a
patch.

> ERROR: Command execution failed: Traceback (most recent call last):
>   File "/OE/bitbake/lib/bb/command.py", line 114, in runAsyncCommand
>   File "/OE/bitbake/lib/bb/cooker.py", line 1605, in updateCache
>   File "/OE/bitbake/lib/bb/cooker.py", line 2087, in __init__
>   File "/OE/bitbake/lib/bb/cooker.py", line 2113, in start
>   File "/usr/lib/python3.8/multiprocessing/process.py", line 121, in start
>   File "/usr/lib/python3.8/multiprocessing/context.py", line 224, in _Popen
>   File "/usr/lib/python3.8/multiprocessing/context.py", line 277, in _Popen
>   File "/usr/lib/python3.8/multiprocessing/popen_fork.py", line 19, in __init__
>   File "/usr/lib/python3.8/multiprocessing/popen_fork.py", line 69, in _launch
> OSError: [Errno 24] Too many open files

This one is as it says, you exceeded the resource limits, so yes, it is
unrelated.

> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> NOTE: No reply from server in 30s
> NOTE: Retrying server connection (#1)...
> 
> On this builder I was using:
> BB_SERVER_TIMEOUT = "60"
> but that doesn't seem to be required to reproduce as the other builds I've seen 
> stuck on jenkins weren't setting BB_SERVER_TIMEOUT at all.

That did at least explain some of the logs as I was wondering!
BB_SERVER_TIMEOUT being set is known to cause problems on the
autobuilders too, we've not been able to adopt it yet. I believe we
opened bugs for the issues although I'm blanking on what they were
right now.

> Let me know if there is something else I should try next time it gets
> stuck, but right now
> I'm not able to reliably reproduce it again (even after switching
> back to default BB_NUMBER_PARSE_THREADS)

I think the reproducer will be some combination of parsing failures and
a need to parse a larger number of recipes. I will give debug some
further thought, I'm not entirely sure how to proceed on this one at
the moment :/.

I suspect if you're not hitting parse failures, things will calm down
though.

Cheers,

Richard



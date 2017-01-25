Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id BC1CD71E53
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:22:01 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id n124so127419445lfd.2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 04:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=HxV1hAbis6GdkX18d73m/c/SN+aGEDWYIE12TP84Oz0=;
	b=UsD7WtdYyQuTSp937KKn7miZtwfo2+HXd7BR8T9EanmCkmw7Hf2blVt/SGOZ++MVpq
	OEa7yNA0+7ha1zFUQpPFF1lqzOMBRbEda+IB06+wdbBEPwVNdBOeIeU4kuUq1sxTcedE
	YOIVJ5V4xGk9NyaXyJ/V0Xps+/8TMskQiPxsc+69y4DJMci3a3IY+eMPm7uaOjahVfj4
	C4Jypv8MiMVkm0gkluhFBf/dKRkw+tiyoCUMemcOJHljGfNGD2le1QQqnpnWRJRALBXe
	3RpX5g3zDHIO2YOUd+xla7a09iogchaeEKaacrhMfkz0ca2hJwb2gXMBRYV5eeJ8EDgT
	q8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=HxV1hAbis6GdkX18d73m/c/SN+aGEDWYIE12TP84Oz0=;
	b=KyUKEH+jlOjiZlJ9YhgLTxvCGaKz3o7Ia8LqoH+bURrj6DRSBR/lbLGIELsFQZO2wk
	Ani1vkjX6aHizsqAbkswVHnJNYjQdjeo0F9F0csrJGp1CEJng4UDRBHepeECy8D7P5G7
	lrj/FS1WXZKTbzCEsuScN8UbFa2IFV5j3hz2MOvzLiReuvSGEjqDdSI+9i+XCqEA7Gjf
	BjIYxCdFOymvishrbGtcbrtUnkPMnP/ug57fEmBPZogrdJQaYTHbYUlJ1REWjdYdFnxT
	px7nCoh3niC5dsvxlnEdTiAc36XwCd/VHetlZI/nAcRZqLhPMXKkkHPa5EymUbMTtqHa
	+Pow==
X-Gm-Message-State: AIkVDXKpULUSau+pjAIRtEry/Ui0jw/tDBDxvDG1gwk68bIbLi+Ii0YeDmRBWBnAWlRHAQ==
X-Received: by 10.46.21.66 with SMTP id 2mr14995555ljv.19.1485346921841;
	Wed, 25 Jan 2017 04:22:01 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	i1sm8281289ljb.15.2017.01.25.04.22.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 04:22:00 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <Openembedded-core@lists.openembedded.org>
References: <18981a79-4241-83a1-a1a8-3eddf941c346@mender.io>
	<1485343441.30673.84.camel@linuxfoundation.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <2c3cfb1f-2a70-5733-07bf-b9c31612a3c3@mender.io>
Date: Wed, 25 Jan 2017 13:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1485343441.30673.84.camel@linuxfoundation.org>
Subject: Re: Overriding fixmepath
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
X-List-Received-Date: Wed, 25 Jan 2017 12:22:03 -0000
X-Groupsio-MsgNum: 92340
Content-Type: multipart/mixed; boundary="------------8F115B63373F6DDD061446F4"

--------------8F115B63373F6DDD061446F4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 25/01/17 12:24, Richard Purdie wrote:
> On Wed, 2017-01-25 at 11:43 +0100, Kristian Amlie wrote:
>> After the new recipe sysroots were introduced we've been having
>> trouble
>> compiling Go. I've narrowed it down to the path replacement mechanism
>> that goes on using fixmepath.
>>
>> For example, this does not work:
>>
>>   bitbake -c cleansstate go-cross
>>   bitbake go-cross
>>
>> But this does:
>>
>>   bitbake -c cleansstate go-cross
>>   bitbake -c prepare_recipe_sysroot go-cross
>>   rm -rf
>> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-
>> linux/go-cross/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-
>> native-1.4.3
>>   cp -r
>> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/sysroots-
>> components/x86_64/go-bootstrap-native/usr/lib/go-bootstrap-native-
>> 1.4.3
>> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-
>> linux/go-cross/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-
>> native-1.4.3
>>   bitbake go-cross
>>
>> IOW, if I replace the recipe sysroot with the originals, it works,
>> but
>> if I keep the modified files put there by the prepare_recipe_sysroot
>> task, it doesn't.
>>
>> And this is where I admittedly get a bit lost: I haven't fully
>> understood how the fixmepath mechanism operates, but from what I can
>> tell, this path replacement is not appropriate for Go. It doesn't
>> care
>> where it's installed, and always operates relative to the GOROOT
>> environment variable, which is set by all Go recipes.
> 
> Does this still work if you remove the
> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/sysroots-
> components/x86_64/go-bootstrap-native directory before building go-
> cross? I worry that its actually referencing the other location and
> using files from there (a different recipe's workdir) and that
> therefore there are a different set of other problems this recipe also
> has.

You mean after executing prepare_recipe_sysroot, right? I tried this,
but it made no difference to my previous results, so presumably it is
looking in the right place.

> 
>> Why the path replacement triggers an error I cannot say, but I
>> suspect it has to do with the fact that Go object files are a bit
>> special compared to C object files, and this operation in fact
>> corrupts them. More mysterious still is why this happens only on some
>> build machines, and not others, but once triggered it appears to be
>> consistently triggered.
> 
> The fixmepath replacements only happen on text files. It could be some
> relocation is needed on the binaries too, perhaps through configuration
> on the commandline or perhaps through the environment. We have had to
> patch some tools to allow relocation in the past too.

I see this happening to .a files as well. Aren't they normally object
files? I have attached the fixmepath file for go-bootstrap-native, which
go-cross uses to build itself.

Looking at one of the files from there, it has quite peculiar contents,
probably something Go internal which we shouldn't mess with:

  $ ar t template.a
  __.PKGDEF
  _go_.6

>> Any advice for what to do next? I could try to skip the fixmepath
>> operation completely, but I'm not sure how, and it feels a bit like
>> using a sledgehammer where I should be using a scalpel.
> 
> Try removing the path I suggested after copying and see if it still
> works. If it does, I'd probably try and find which subset of the files
> breaks it, narrow down the issue. If removing it breaks things, there
> is a whole world of bigger issues :(
> 
> Its possible to add specific inclusions/exclusions from fixmepath FWIW
> but we need to understand more about what is happening first.

Take a look at the attached file, to me the inclusion of .a files in the
fixmepath file seems wrong, so I can start with that, unless you have
better idea.

-- 
Kristian

--------------8F115B63373F6DDD061446F4
Content-Type: text/plain; charset=UTF-8;
 name="fixmepath.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fixmepath.txt"

cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9saWIvZ28tYm9vdHN0cmFwLW5hdGl2ZS0xLjQuMy9w
a2cvbGludXhfYW1kNjQvaHRtbC90ZW1wbGF0ZS5hCnJlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
bGliL2dvLWJvb3RzdHJhcC1uYXRpdmUtMS40LjMvcGtnL2xpbnV4X2FtZDY0L3N5c2NhbGwuYQpy
ZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9nby1ib290c3RyYXAtbmF0aXZlLTEuNC4zL3Br
Zy9saW51eF9hbWQ2NC9jcnlwdG8veDUwOS5hCnJlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGli
L2dvLWJvb3RzdHJhcC1uYXRpdmUtMS40LjMvcGtnL2xpbnV4X2FtZDY0L2NyeXB0by90bHMuYQpy
ZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9nby1ib290c3RyYXAtbmF0aXZlLTEuNC4zL3Br
Zy9saW51eF9hbWQ2NC90ZXh0L3RlbXBsYXRlLmEKcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9s
aWIvZ28tYm9vdHN0cmFwLW5hdGl2ZS0xLjQuMy9wa2cvbGludXhfYW1kNjQvZ28vYXN0LmEKcmVj
aXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9saWIvZ28tYm9vdHN0cmFwLW5hdGl2ZS0xLjQuMy9wa2cv
bGludXhfYW1kNjQvZGVidWcvZWxmLmEKcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9saWIvZ28t
Ym9vdHN0cmFwLW5hdGl2ZS0xLjQuMy9wa2cvbGludXhfYW1kNjQvbmV0L2h0dHAuYQpyZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9nby1ib290c3RyYXAtbmF0aXZlLTEuNC4zL3BrZy9saW51
eF9hbWQ2NC9uZXQvaHR0cC9jZ2kuYQpyZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9nby1i
b290c3RyYXAtbmF0aXZlLTEuNC4zL3BrZy9saW51eF9hbWQ2NC9uZXQvaHR0cC9odHRwdXRpbC5h
CnJlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliL2dvLWJvb3RzdHJhcC1uYXRpdmUtMS40LjMv
cGtnL2xpbnV4X2FtZDY0L25ldC9odHRwL2ZjZ2kuYQpyZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNy
L2xpYi9nby1ib290c3RyYXAtbmF0aXZlLTEuNC4zL3BrZy9saW51eF9hbWQ2NC9uZXQvaHR0cC9o
dHRwdGVzdC5hCnJlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliL2dvLWJvb3RzdHJhcC1uYXRp
dmUtMS40LjMvcGtnL2xpbnV4X2FtZDY0L25ldC9odHRwL3Bwcm9mLmEKcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL3Vzci9saWIvZ28tYm9vdHN0cmFwLW5hdGl2ZS0xLjQuMy9wa2cvbGludXhfYW1kNjQv
bmV0L3NtdHAuYQpyZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9nby1ib290c3RyYXAtbmF0
aXZlLTEuNC4zL3BrZy9saW51eF9hbWQ2NC9uZXQvcnBjLmEKcmVjaXBlLXN5c3Jvb3QtbmF0aXZl
L3Vzci9saWIvZ28tYm9vdHN0cmFwLW5hdGl2ZS0xLjQuMy9wa2cvbGludXhfYW1kNjQvbmV0LmEK
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9saWIvZ28tYm9vdHN0cmFwLW5hdGl2ZS0xLjQuMy9w
a2cvbGludXhfYW1kNjQvY21kL3Bwcm9mL2ludGVybmFsL2RyaXZlci5hCnJlY2lwZS1zeXNyb290
LW5hdGl2ZS91c3IvbGliL2dvLWJvb3RzdHJhcC1uYXRpdmUtMS40LjMvcGtnL2xpbnV4X2FtZDY0
L2NtZC9pbnRlcm5hbC9yc2MuaW8vYXJtL2FybWFzbS5hCnJlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvbGliL2dvLWJvb3RzdHJhcC1uYXRpdmUtMS40LjMvc3JjL3J1bnRpbWUvenZlcnNpb24uZ28K

--------------8F115B63373F6DDD061446F4--

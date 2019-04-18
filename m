Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id F09EF7D249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:56:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id w10so3598750wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=DWsEKSwgYlhrE//GJH7OEQNSmXPJ10wZp8jJtVMAbHs=;
	b=ignNyN8O9TzcCIew27WHcrrlDXgPO0/P1zPe7n1nHL4DbZByQfPd9/IhBXn4YrJuc8
	T/8ApsZbjLBH5hIMQQuTnhPuse1WWYtm3N0GVu09ssihH1VPjL6imWNTN6Wt5VwxM1PC
	lUbbT+iU2Vkxj5n7s3PbVOjPWJVVlJPmofznA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DWsEKSwgYlhrE//GJH7OEQNSmXPJ10wZp8jJtVMAbHs=;
	b=Etfh3nqIzSAxqh9Na/TbPkRhv3MEqxS16AJ650i5mhiZHGAsBwiMTGXh0tJ6LToy6H
	UJ6MCPdq3lRgzFi0I4pSvQVEy+0axfxNwPDyOxEgKdVb4sldwxEzVQ2q/JLngGsrWTlx
	Fvh4VeDELgU49/wPbww0bTReWbinE2Z1MZTdd32snVRGmkpFxKFIjZOwD0R2h0LT3LVy
	HrdkZqEzV0BNxd2FSCj2RPd5HKDAhE8scVdbUf/+L9XKPLf3mmnD3YRhTLfzYwHJalwh
	ukzL6ssSS7S+SFdE2y/YX0zXx71V07nG/62ttcPyJ+p1LFeeBG9nCUkwbit6dz+QyuOf
	JgSw==
X-Gm-Message-State: APjAAAVziay5j9B76wiMLq/oCbphnUXvndQPfZit4vOaynIFLZ8u5TQB
	CK4XQx80LcKLsAGrnMnWF4mqFE7Ue5k=
X-Google-Smtp-Source: APXvYqwvd++AbqeTmjuOA89+XmXjOUFbdWjwwH8vuj/GdKx3xYtQVxDXVEe8IyMLAW4uzZWQ6Dc4iw==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr60637948wro.232.1555603000406; 
	Thu, 18 Apr 2019 08:56:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id g6sm3105910wro.73.2019.04.18.08.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 08:56:39 -0700 (PDT)
Message-ID: <76ac715b26d69d953d3ae56955f01d38f60c07b2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Apr 2019 16:56:38 +0100
In-Reply-To: <6b07892b2df87ec0f9195109d5be39a02d74c04a.camel@linuxfoundation.org>
References: <6b07892b2df87ec0f9195109d5be39a02d74c04a.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: Recipes with ptest dependency problems
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
X-List-Received-Date: Thu, 18 Apr 2019 15:56:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-17 at 22:55 +0100, Richard Purdie wrote:
> I mentioned differences in numbers of pass/fail depending on which
> image you install ptests into. The recipes which have the issues and
> the numbers are:
> 
> core-image-sato with ptest installed:
> 
> Recipe                       | Passed      | Failed   | Skipped   | 
> 
> diffutils                    | 20          | 0        | 1         | 
> elfutils                     | 31          | 6        | 166       | 
> flex                         | 0           | 0        | 0         | 
> gzip                         | 3           | 19       | 0         | 
> libxml-parser-perl           | 0           | 15       | 0         | 
> lttng-tools                  | 3397        | 626      | 1         | T
> nettle                       | 95          | 2        | 2         | 
> openssh                      | 0           | 0        | 1         | 
> perl                         | 2425        | 20       | 235       | 
> python                       | 304         | 6        | 39        | 
> python3                      | 30321       | 2        | 1019      | 
> quilt                        | 23          | 34       | 0         | 
> tcl                          | 148         | 1        | 0         | 
> util-linux                   | 378         | 2        | 58        | 
> valgrind                     | 0           | 0        | 0         | 

The testresults.json file for these tests is:

https://autobuilder.yocto.io/pub/non-release/20190417-10/testresults/qemux86-64-ptest/testresults.json

To get the report above you can:

wget https://autobuilder.yocto.io/pub/non-release/20190417-10/testresults/qemux86-64-ptest/testresults.json
/path/to/oe-core/scripts/resulttool report testresults.json

To get the test log output you can:

wget https://autobuilder.yocto.io/pub/non-release/20190417-10/testresults/qemux86-64-ptest/testresults.json
/path/to/oe-core/scripts/resulttool store testresults.json /path/to/new-results-gitrepo
cd /path/to/new-results-gitrepo
git checkout master-next
less repo/runtime/poky/qemux86-64/core-image-sato-ptest/ptest-lttng-tools.log

> core-image-sato-sdk with ptest installed:
> 
> Recipe                       | Passed      | Failed   | Skipped   | 
> 
> diffutils                    | 21          | 0        | 0         | 
> elfutils                     | 31          | 4        | 168       | 
> flex                         | 114         | 0        | 0         | 
> gzip                         | 22          | 0        | 0         | 
> libxml-parser-perl           | 15          | 0        | 0         | 
> lttng-tools                  | 4693        | 1        | 412       | 
> nettle                       | 96          | 1        | 2         | 
> openssh                      | 67          | 0        | 3         | 
> perl                         | 2430        | 19       | 231       | 
> python                       | 131         | 1        | 17        | 
> python3                      | 30329       | 2        | 1011      | 
> quilt                        | 57          | 0        | 0         | 
> tcl                          | 149         | 0        | 0         | 
> util-linux                   | 473         | 2        | 52        | 
> valgrind                     | 297         | 251      | 31        | 

For these the testresults.json file is:

https://autobuilder.yocto.io/pub/non-release/20190417-14/testresults/qemux86-64-ptest/testresults.json

Commands to diving into this are similar to the above.

I would like to:

a) teach resulttool how to handle http urls itself
b) add a command just to dump the ptest logs to the current directory
c) add the logs to the autobuilder http:// urls magically

but simply haven't gotten there with those yet, the tool itself is
clearly nearly there!

Cheers,

Richard




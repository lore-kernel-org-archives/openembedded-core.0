Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 127F16BDBC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 01:45:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r841jq1K017363
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 18:45:52 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Sep 2013 18:45:51 -0700
Message-ID: <522690CF.6030707@windriver.com>
Date: Tue, 3 Sep 2013 20:45:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
In-Reply-To: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
Subject: Re: GCC search paths in MinGW SDK
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
X-List-Received-Date: Wed, 04 Sep 2013 01:45:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/13 4:13 PM, Francois Retief wrote:
> Hi all,
>
> Thanks to Richard's recent improvements in the oe-core tree, I finally got my
> first MinGW build to compile through and generate a SDK tarball.
>
> Next issue is that on windows GCC is unable to find the crt1.o, crti.o and
> crtbegin.o files. when compiling a small hello world app (see gist
> <https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03>
> [1] for gcc verbose output). I verified that the files are indeed in the SDK
> folders and was correctly unpacked.
>
> Next, I checked the search path (-L) options and they point to the respective
> directories where the files reside.
>
> Is it hard coded somewhere GCC should look for these files?  Can anyone give me
> some pointers where to start looking?

Usually GCC can learn the location where it was executed from, and then use a 
relative path from that to the location where the libc and other components are 
located.

> Cheers,
>    Francois
>
> ps. I have noticed that there is a relocate_sdk.py file in the root of the SDK
> folder. What is it's purpose and can it have anything to do with the GCC search
> paths?

On linux we play with the RPATH and other components to ensure that the 
executables can file the libraries for execution.  I don't believe that is a 
problem on windows as the DLLs are searched automatically.

--Mark

> [1]
> https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03
> [2] https://github.com/fgretief/meta-mingw
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



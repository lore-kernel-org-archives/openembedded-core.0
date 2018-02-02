Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D84771B48
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 14:49:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w12En2Gn004061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Feb 2018 06:49:02 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 2 Feb 2018 06:49:02 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1517541572.git.liezhi.yang@windriver.com>
	<3e5edeaacf65212a1fce974e5eef6c4ac2e088e1.1517541572.git.liezhi.yang@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <4ed18a6d-8741-295b-087b-8dd7f158f949@windriver.com>
Date: Fri, 2 Feb 2018 09:49:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <3e5edeaacf65212a1fce974e5eef6c4ac2e088e1.1517541572.git.liezhi.yang@windriver.com>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH 3/4] runqemu: check for qemuboot.conf and raise error
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
X-List-Received-Date: Fri, 02 Feb 2018 14:49:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-02-01 10:23 PM, Robert Yang wrote:
> [YOCTO #12503]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   scripts/runqemu | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 0ca62f4..d50c6d1 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -417,6 +417,9 @@ class BaseConfig(object):
>   
>           unknown_arg = ""
>           for arg in sys.argv[1:]:
> +            if arg.endswith('.qemuboot.conf'):
> +                raise RunQemuError("qemuboot.conf is not supported any more, use qemuboot.json to instead of it")
> +
better wording:
  qemuboot.conf format is no longer supported, use a qemuboot.json file 
instead.



../Randy

>               if arg in self.fstypes + self.vmtypes:
>                   self.check_arg_fstype(arg)
>               elif arg == 'nographic':
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company


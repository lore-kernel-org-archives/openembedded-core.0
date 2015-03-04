Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 22AB560144;
	Wed,  4 Mar 2015 13:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t24D4L5q026611; Wed, 4 Mar 2015 13:04:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H7h1hxfhC283; Wed,  4 Mar 2015 13:04:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t24D4WT0026672
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 4 Mar 2015 13:04:44 GMT
Message-ID: <1425474272.26813.94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 04 Mar 2015 13:04:32 +0000
In-Reply-To: <20150304125815.GI2337@jama>
References: <20150302220550.8A2F450367@opal.openembedded.org>
	<20150304022312.GF2337@jama> <54F67EBD.4060609@windriver.com>
	<20150304125815.GI2337@jama>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: improve patch application performance
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
X-List-Received-Date: Wed, 04 Mar 2015 13:04:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-03-04 at 13:58 +0100, Martin Jansa wrote:
> And another one from restarted qemux86 build:
> 
> ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.22612)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.22612
> Log data follows:
> | DEBUG: Executing shell function do_kernel_configme
> | NOTE: kernel configme
> | [INFO] Configuring target/machine combo: "standard/qemux86"
> | [INFO] collecting configs in .meta/meta-series
> | ERROR: could not sanitize configuration fragments
> |    errors are logged in /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-source/.meta/cfg/standard/common-pc/config.log
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.22612)
> NOTE: recipe linux-yocto-3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0: task do_kernel_configme: Failed
> 
> I understand that these error logs aren't very helpful, but the tmpfs is already gone.
> 
> All I can say was that I wasn't seeing these issues until yesterday.

Just as another data point, the autobuilder isn't showing this, nor are
my local builds.

Cheers,

Richard



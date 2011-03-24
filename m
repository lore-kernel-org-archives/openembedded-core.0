Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2bVt-0000yJ-HJ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 04:47:09 +0100
Received: by iyb26 with SMTP id 26so9695212iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=u1Dv7wRVGwBKhl6PSnagRzlvQ531sZ9WqG5uWJuUik4=;
	b=nfxX868QsQyntB1zYptg8yf2bQZpCY/dD8FmLj7MR5nzlZQXolQcfmJ2oclhezd1kr
	3BvqRs3pvruOy/FYlYMTppZw4FuuQih6qk1qEEMLUAEgEqPLbDiopAsIMr65tBn6JQwm
	DapRDg0HMAa7bOiXFHrTfnqBugdCEzobbYKE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=aNyptHeHqXCdCh7K4UkG1nbIc1E6OuE5qNyWklL4tdsTpoFGzmkcNloK/rm4aQUTH6
	efWf5G1aR3cyZxTvyTQnwoq8Tkxujad4u+gjH6Tz45vNyc3Ai3QnBvdd1JpxSWqcn+CS
	ATTnW9l1X02lWPfboVQiOus1IImiyhEzc7YXk=
Received: by 10.231.23.129 with SMTP id r1mr7700728ibb.30.1300938317400;
	Wed, 23 Mar 2011 20:45:17 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id mv26sm2509996ibb.11.2011.03.23.20.45.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 20:45:16 -0700 (PDT)
Date: Wed, 23 Mar 2011 20:45:37 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110324034537.GA31158@sakrah.homelinux.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Parsing error when adding a python function in .inc file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2011 03:47:09 -0000
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I am facing a strange problem. I am trying to add a small python function to qemu.inc and bitbake keeps telling me this

NOTE: Out of date cache found, rebuilding...
ERROR: Error parsing
/home/kraj/work/newoe/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_git.bb:
Failure expanding variable EXTRA_OECONF, expression was
${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls
--enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370
which triggered exception NameError: name 'get_qemu_target_list' is not
defined
ERROR: Command execution failed: Exited with 1


Now if I move this function into a separate file say qemu-targets.inc
and require qemu-targets.inc inside qemu.inc then it works correctly

There is similar kind of code in gcc-common.inc which is used in
different inc files in gcc. I tried to use the python function defined
in gcc-common.inc in same gcc-common.inc file and it worked so I dont
know why qemu.inc case is special.

Any insights ?

I have attached the patch which I am using

-- 
-Khem

--Q68bSM7Ycu6FN28Q--

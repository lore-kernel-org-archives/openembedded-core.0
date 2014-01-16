Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3C02D6B186
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 01:45:05 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1W3c11-0006JM-3r for openembedded-core@lists.openembedded.org;
	Thu, 16 Jan 2014 02:45:03 +0100
Received: from t2.fujitsu.co.jp ([164.71.1.147])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 02:45:03 +0100
Received: from lizhijian by t2.fujitsu.co.jp with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 02:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: lizhijian <lizhijian@cn.fujitsu.com>
Date: Thu, 16 Jan 2014 01:40:19 +0000 (UTC)
Message-ID: <loom.20140116T023635-533@post.gmane.org>
References: <CAAA4K6LV4bPEV2QXUMgwV6NMQSU2h=2Qon08F9hnRjRZUejMgA@mail.gmail.com>
	<CAAA4K6L1f77Jh=5-16TMQmGDtki447oj_+Q5ydWER52iKb8Ryg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 164.71.1.147 (Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36
	(KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36)
Subject: Re: [yocto] Is there anyway to get patched source tar file for gcc while building srpm?
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
X-List-Received-Date: Thu, 16 Jan 2014 01:45:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Jegan Chandru <pcjegan@...> writes:

> 
> 
> <<bump>>
> Added poky and oe-core.
> 
> anyone?On Thu, Jun 7, 2012 at 8:23 PM, Jegan Chandru <pcjegan-
Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:Hi,
> Framework - poky-denzil-7.0
> arch - x86_64
> 
> Is there anyway to get patched source tar file for gcc while building 
srpm? I have checked the srpms created and found gcc srpms has only the 
logs_with_scripts tar file and not the patched source. I have configured 
"archive-patched-source" in local.conf. Upon checking on archiver.bbclass, 
noticed "not_tarball" function is excluding work-shared dir.This dir is used 
by gcc only for building. I can see the obvious reason here that(correct me 
if I am wrong) since this source has been used by, say gcc-cross-
intermediate, gcc-cross-4.6.3 and gcc-runtime-4.6.3 bb files and you dont 
want to archive that source. But anyone can tell me the exact reason on why 
work-shared is being omitted for archiving? Also, I must include that, there 
are total 40 patches for gcc and all patches getting applied in gcc-4.6.inc. 
So I think there is no harm in archiving that source.
> 
> 
> 
> As a try and error, I have created a dummy function for not_tarball and 
tried to build, but that didnt work! ;(
> 
> So please anyone shed some light on this matter. It is much appreciated.
> 
> 
> I need srpm with source for stabilizing and do some testing.
> 
> Also there is a high chance that I missed something, so feel free to 
correct me. ;)
> 
> Thanks,
> -JC
> 
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> poky mailing list
> poky@...
> https://lists.yoctoproject.org/listinfo/poky
> 

I got the same issue. and before see your thread, i have sent a email
to yocto. Do you have solved it

thx
li.






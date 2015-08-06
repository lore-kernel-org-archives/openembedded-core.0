Return-Path: <mihaly.varga@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3A676424
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 17:06:04 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t76H630X003523; Thu, 6 Aug 2015 12:06:03 -0500
Received: from mihaly-ro-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015080612060318-1046603 ;
	Thu, 6 Aug 2015 12:06:03 -0500 
From: Mihaly Varga <mihaly.varga@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 6 Aug 2015 20:04:49 +0300
Message-Id: <1438880692-35724-1-git-send-email-mihaly.varga@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/06/2015 12:06:03 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/06/2015 12:06:03 PM,
	Serialize complete at 08/06/2015 12:06:03 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-06_09:, , signatures=0
Subject: Re: wic: Add plugin for hybrid iso image
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
X-List-Received-Date: Thu, 06 Aug 2015 17:06:12 -0000


Hi Ed,

Thank you for your comments. There is a slightly modified version of
the isoimage-isohybrid plugin, the kickstart file and the wic selftest 
extended with the iso image creation test case.
  
On 7/28/2015 1:57 PM, Ed Bartosh wrote:
> Hi Mihaly,
>
> The code looks ok to me.
>
> Can you please fix the following:
>
> 1. Pylint is reporting a lot of long lines, indentation and other
> issues, so it would be nice if you run it and fix at least some of them?
>
> 2. Docstring of plugin class is shown in 'wic help plugins' output. Some
> lines of your plugins look very long there. Please, reformat them.
>
> 3. kickstart.get_timeout has a parameter to specify default timeout
> value. You can use that instead of assigning default value in the code.
>
> 4. Using names prefixed by two underscores is only needed if you're
> really concerned about the name and want it to be mangled by python. One
> underscore is more than enough in most cases.
>
> 5. Please add test case(s) for your plugin to
> meta/lib/oeqa/selftest/wic.py. This can help keeping your plugin
> in working state as yocto autobuilder regularly runs all tests.
>
> 6. What's crdtools and how to bake them?
This is a typo in the commit message, is about cdrtools program set,
which contains the mkisofs program. I corrected the commit message.

Best regards
  Mihaly 





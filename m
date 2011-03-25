Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3Fzq-00075k-W5
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Mar 2011 00:00:47 +0100
Received: by pvc30 with SMTP id 30so213695pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 15:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=TH5GJe/uNIQgq+O32Dfmws00bC4sv7x6BuaEoZ/jx1Y=;
	b=ZBu2weroKcQvxjQLypjMEGsknOF24KjqoagmuCRRCD/x4K2Dh8ZOB+E7hC4le29L5d
	wpHAgDL0L0EVK5DydRyRwkS6S0nnUOvVVRvC/evOTEUhm2yaKuPm/KWcxPSLzcrL/Ivl
	Fjzjpxz+4OTJcUOsus6NGiO5wNQ96N/5njbWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=g2d5twHnnxaj6jDpPEbNS/yjfmIDguUT3cXysHrMBqc3Sj2TYdIxLz5L6buEDi7I8P
	SoiGGQs90mnVq0LeaWZv1BRzH4C6wqM4mAlzGZN5+EGin2LTlguDvHGDKjf54y5bfba8
	pQOzpWlwOU9VbLfZv01zXUy6OU3y9bqPq2o9E=
Received: by 10.142.60.5 with SMTP id i5mr1101581wfa.135.1301093931865;
	Fri, 25 Mar 2011 15:58:51 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s41sm1909690wfc.3.2011.03.25.15.58.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2011 15:58:50 -0700 (PDT)
Date: Fri, 25 Mar 2011 15:59:24 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110325225924.GA11423@sakrah.homelinux.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Testcases to show bitbake malfunction when using python functions in recipes
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
X-List-Received-Date: Fri, 25 Mar 2011 23:00:47 -0000
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Attached are two patched good.patch and bad.patch both can be applied on
top of oe-core independently in two trees.

Then bitbake -p or bitbake -e qemu-native and search for EXTRA_OECONF

You will see that good.patch works but bad.patch does not

What I observed is it

put the python func in .bb - work
in .inc included by .bb - Does not work
in .inc -> .inc -> .bb - works
in  .inc -> .inc -> .inc -> .bb - Does not work

So there seems to be a pattern here

Let me  know if more info is needed


-- 
-Khem

--7JfCtLOvnd9MIVvH--

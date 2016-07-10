Return-Path: <denis@denix.org>
X-Greylist: delayed 3602 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Jul 2016 22:36:26 UTC
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9309B6FF93
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 22:36:26 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA400B7WBZZPQ70@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 10 Jul 2016 16:36:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=kj9zAlcOel0A:10 a=cAmyUtKerLwA:10	a=u4FXPgRJnUfVAE3bztAA:9
	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 2364bd4c; Sun, 10 Jul 2016 21:36:10 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5BE231620AC; Sun,
	10 Jul 2016 17:35:59 -0400 (EDT)
Date: Sun, 10 Jul 2016 17:35:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20160710213559.GC8521@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Can NOT get PRAUTO, exception [Errno -3] Temporary failure in name resolution
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
X-List-Received-Date: Sun, 10 Jul 2016 22:36:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Has anyone ever seen this error message:

ERROR: blah-blah do_package: Can NOT get PRAUTO, exception [Errno -3] Temporary failure in name resolution

I'm using centralized PR Service over the network on a local subnet. I just 
got this message on 2 different machines for 3 separate packages. Should I be 
worried about it? Should I look into networking HW issues or into PR server 
instance or something else? Should I switch over to using IP address instead 
of FQDN and even more - use static IP? Any best practices? Thanks.

-- 
Denys


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 217BC731C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 21:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0LLu83h016043; Thu, 21 Jan 2016 21:56:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zuQS4sTIGRvg; Thu, 21 Jan 2016 21:56:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0LLuIq6016058
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Jan 2016 21:56:19 GMT
Message-ID: <1453413378.27999.173.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 21:56:18 +0000
In-Reply-To: <2992852.OT1HfBaFUF@peggleto-mobl.ger.corp.intel.com>
References: <cover.1453363852.git.liezhi.yang@windriver.com>
	<20160121081654.GD31212@axis.com> <56A099D8.4020908@windriver.com>
	<2992852.OT1HfBaFUF@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA
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
X-List-Received-Date: Thu, 21 Jan 2016 21:56:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-22 at 07:29 +1300, Paul Eggleton wrote:
> On Thu, 21 Jan 2016 16:42:00 Robert Yang wrote:
> > On 01/21/2016 04:16 PM, Olof Johansson wrote:
> > > On 16-01-21 00:11 -0800, Robert Yang wrote:
> > > > --- a/meta/classes/insane.bbclass
> > > > +++ b/meta/classes/insane.bbclass
> > > > @@ -1098,6 +1098,7 @@ python do_package_qa () {
> > > > 
> > > >   do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
> > > >   do_package_qa[rdeptask] = "do_packagedata"
> > > > 
> > > > +do_package_qa[vardeps] += "${WARN_QA} ${ERROR_QA}"
> > > 
> > > Shouldn't this be "WARN_QA ERROR_QA"? Or you'll get the expanded
> > > values of the variables.
> > 
> > Sorry, please drop this patch, need more work it.
> 
> Aside from that, didn't we already have a discussion on whether
> changing these 
> variables should force do_package_qa to re-execute? Ross, I seem to
> recall you 
> were involved last time.

Last time around we ended up with:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f6ec8dfaf7f98ade05d6292d2fea42805c4d80a7

Cheers,

Richard


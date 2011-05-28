Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQJom-0006PO-8Q
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 15:44:40 +0200
Received: by wwb17 with SMTP id 17so2251988wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 06:41:34 -0700 (PDT)
Received: by 10.227.195.145 with SMTP id ec17mr3155376wbb.88.1306590094110;
	Sat, 28 May 2011 06:41:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p21sm1848413wbh.40.2011.05.28.06.41.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 06:41:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE0F6D6.1000105@intel.com>
Date: Sat, 28 May 2011 15:41:30 +0200
Message-Id: <01B1A9BA-ED8E-4D58-8715-7EF3B1A98E2E@dominion.thruhere.net>
References: <4DE02216.1010003@intel.com>
	<B424D198-12A5-4C45-93D7-C5CFA6C97BA5@dominion.thruhere.net>
	<4DE0F6D6.1000105@intel.com>
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
X-Mailer: Apple Mail (2.1084)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes	rebased sans debug
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
X-List-Received-Date: Sat, 28 May 2011 13:44:40 -0000
Content-Type: multipart/mixed; boundary=Apple-Mail-8--282107427

--Apple-Mail-8--282107427
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Here you go :)


Op 28 mei 2011, om 15:21 heeft Elizabeth Flanagan het volgende geschreven:

> Could you send me the log. That's odd and shouldn't have happened (the license is only two licenses...)
> 
> -b
> 
> On 05/28/2011 02:16 AM, Koen Kooi wrote:
>> 
>> Op 28 mei 2011, om 00:13 heeft Elizabeth Flanagan het volgende geschreven:
>> 
>>> 
>>> Using python abstract syntax trees as a parser and an ast visitor class, I've
>>> begun the first steps to being able to put some sanity to license selection.
>>> 
>>> One note. License modifiers have traditionally been limited to the "or greater"
>>> modifier "+". I've added another modifier "with exceptions" for licenses that
>>> have no generic ie common-licenses/GPL-2,0-with-GCC-exception
>> 
>> When building shadow I get:
>> 
>> | WARNING: /home/koen/angstrom-core/sources/openembedded-core/meta/files/common-licenses
>> | ERROR: Error executing a python function in /home/koen/angstrom-core/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb:
>> | RuntimeError: maximum recursion depth exceeded while calling a Python object
>> |
>> | ERROR: The stack trace of python calls that resulted in this exception/failure was:
>> | ERROR:   File "do_populate_lic", line 121, in<module>
>> | ERROR:
>> | ERROR:   File "do_populate_lic", line 118, in do_populate_lic
>> | ERROR:
>> | ERROR:   File "/usr/lib64/python2.7/ast.py", line 243, in visit
>> | ERROR:     return visitor(node)
>> | ERROR:
>> | ERROR:   File "do_populate_lic", line 13, in generic_visit
>> 
>> and a few hundred more lines, I had to change the scrollback buffer from 512 lines to unlimited to catch this :) I can send the full log on request.
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> 
> 
> -- 
> ---------------
> Elizabeth Flanagan
> Yocto Project
> Release Engineer


--Apple-Mail-8--282107427--

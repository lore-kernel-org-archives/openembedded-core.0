Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 57E1872F4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 23:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28N8Kxh030875; Wed, 8 Mar 2017 23:08:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XB_ScUdwXsHF; Wed,  8 Mar 2017 23:08:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28N8G2F030872
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Mar 2017 23:08:17 GMT
Message-ID: <1489014495.22968.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	liu.ming50@gmail.com
Date: Wed, 08 Mar 2017 23:08:15 +0000
In-Reply-To: <1489010552.3261.35.camel@linux.intel.com>
References: <1488982634-24222-1-git-send-email-liu.ming50@gmail.com>
	<1489010552.3261.35.camel@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Do not append to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 08 Mar 2017 23:10:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-08 at 16:02 -0600, Leonardo Sandoval wrote:
> Hi
> 
> you need to send a v2 revision, following the shortlog format
> 
> * Patch            Do not append to BBCLASSEXTEND
>  Issue             Shortlog does not follow expected format
> [test_shortlog_format] 
>   Suggested fix    Commit shortlog (first line of commit message)
> should follow the format "<target>: <summary>"

Ross actually added one when he added the patch to mut but please
remember to do this in future.

Cheers,

Richard


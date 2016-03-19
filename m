Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 194BA6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 12:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2JCGVsp002163; Sat, 19 Mar 2016 12:16:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id flbJO6H9Wn1r; Sat, 19 Mar 2016 12:16:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2JCGSsO002159
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 19 Mar 2016 12:16:29 GMT
Message-ID: <1458389788.7615.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Date: Sat, 19 Mar 2016 12:16:28 +0000
In-Reply-To: <56ED1FF4.7040901@topic.nl>
References: <56ED1FF4.7040901@topic.nl>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: How to avoid the poisoned sysroot?
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
X-List-Received-Date: Sat, 19 Mar 2016 12:16:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-03-19 at 10:46 +0100, Mike Looijmans wrote:
> After this commit:
>    
> http://comments.gmane.org/gmane.comp.handhelds.openembedded.scm/81849
> 
> some recipes fail with strange errors like:
>    "fatal error: stdint.h: No such file or directory"
> 
> What is wrong with the target recipe when this happens? What's
> expected 
> of me?

It means that something is calling the cross compiler or linker but
losing our flags, particularly the --sysroot one. You need to ensure
the flags are getting passed in.

Cheers,

Richard




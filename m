Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 585DE6D762
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 23:31:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1DNVSjA021839; Thu, 13 Feb 2014 23:31:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eYfBnPyFGDAT; Thu, 13 Feb 2014 23:31:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1DNVNQ5021834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 13 Feb 2014 23:31:25 GMT
Message-ID: <1392334278.14081.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 13 Feb 2014 23:31:18 +0000
In-Reply-To: <CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Thu, 13 Feb 2014 23:31:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-02-13 at 15:56 -0200, Diego Sueiro wrote:
> 
> On Tue, Feb 11, 2014 at 10:34 AM, Diego Sueiro
> <diego.sueiro@gmail.com> wrote:
>         libQtUiToolsE.a is just present at qt4-embedded-staticdev
>         package. Shouldn't it needed to be added to
>         meta-toolchain-qte?
> 
> Should I have to send a patch to fix this?

Well, if you build static binaries you need the staticdev packages. By
default we assume people tend to use dynamic libraries and the SDK is
therefore setup that way.

So I'm not sure there is any need to "fix" anything, the system is
working as designed. If you want to improve the documentation, I'm sure
Scott would love some help with that though.

Cheers,

Richard




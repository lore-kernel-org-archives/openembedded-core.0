Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B1F79703B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 13:32:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6IDVZuP013711; Fri, 18 Jul 2014 14:31:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g9qQYEPj_TES; Fri, 18 Jul 2014 14:31:57 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6IDVsMH013728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 14:31:56 +0100
Message-ID: <1405690309.26348.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 18 Jul 2014 14:31:49 +0100
In-Reply-To: <8a2f5d0e429d76a916afc1177cd0d74acadc20f0.1405562859.git.Qi.Chen@windriver.com>
References: <cover.1405562859.git.Qi.Chen@windriver.com>
	<8a2f5d0e429d76a916afc1177cd0d74acadc20f0.1405562859.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] package.bbclass: ensure correct modes on directories
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
X-List-Received-Date: Fri, 18 Jul 2014 13:32:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-17 at 10:08 +0800, Chen Qi wrote:
>                  fstat = cpath.stat(src)
>                  os.mkdir(dest, fstat.st_mode)
> +                os.chmod(dest, fstat.st_mode)

This doesn't make sense. Shouldn't the fstat.st_mode to os.mkdir have
taken care of the mode for us?

Cheers,

Richard




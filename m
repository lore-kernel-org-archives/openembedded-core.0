Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>)
	id 1UL7hN-00038p-LN; Thu, 28 Mar 2013 08:56:44 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so4460033dak.30
	for <multiple recipients>; Thu, 28 Mar 2013 00:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=uGzjTM+hr8vHqX8EGswZil2CyRLUG6uRpW08fBqmlQk=;
	b=i7KGW2g+7n+mnUQXsp2qLL0k41SNmGkdubyonegYdGht+erneMt9XfnPyrZ6FrYdoX
	IC5pG/ROo7Z7vvWqIjpKAx8S4jysBDSxKZmN3QyzrhgSnEfya8OPGbx6zBw3t99ySeGv
	axtQ4spR8e9UCj0GYGprNzhyR7pounkAlhD1ewOVwoyppLdeCrj0nLQK+EAsiZyheF40
	E2QcD5IYdGuiAMuRBOFBzf1bgLUPRoeHLW3S9rUHlHXnA8B+xyeCKAZfNdBw2+NBrxaF
	Hbo/wQFtjmD4miSgZbL3BZx703CfaNWDiEszEgRc/ml0vwILgZnewZzSsQa+jOYLKWGs
	l95w==
X-Received: by 10.68.138.135 with SMTP id qq7mr33730064pbb.42.1364456374208;
	Thu, 28 Mar 2013 00:39:34 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([117.89.54.175])
	by mx.google.com with ESMTPS id is1sm24567867pbc.15.2013.03.28.00.39.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 00:39:33 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2013 15:36:39 +0800
Message-ID: <3600816.RW924nKEqn@yiqingliang-pc>
User-Agent: KMail/4.10.1 (Linux/3.8.4-1-ARCH; KDE/4.10.1; x86_64; ; )
In-Reply-To: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 07:56:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

GREAT!
qt5 is another one I expected!

On Wednesday, March 27, 2013 10:51:50 PM Khem Raj wrote:
> All,
> 
> I have added gcc 4.8 recipes and the branch is here
> 
> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
> 
> cgit
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-4.8
> 
> Please test it out on your respective environments if you can.
> 
> To enable gcc 4.8 with OE-Core you would
> 
> in local.conf set
> 
> GCCVERSION = "4.8%"
> 
> and if you use angstrom. Please checkout 'next' branch of setup-scripts
> and then in conf/local.conf
> 
> set
> 
> ANGSTROM_GCC_VERSION = "4.8%"
> 
> My testing so far has been building systems-image for all qemu machines and
> they seem to boot as good as 4.7 did. But I am hoping for wider testing and
> finding issues or very least improve the existing recipes for now and once
> the 1.4 release is done we can then propose it for inclusion in OE-Core
> 
> Thanks for your time
> 
> 
> -Khem
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com



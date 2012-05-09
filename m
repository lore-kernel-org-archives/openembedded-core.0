Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SS9gu-0003hD-6h
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:24:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49GEi6t002192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2012 09:14:44 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 09:14:44 -0700
Message-ID: <4FAA97F3.3050900@windriver.com>
Date: Wed, 9 May 2012 11:14:43 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>	<056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
	<CAF6bG8eTT0OPwLdJR1C=Acb+fx0oD4GLmRTwt5qX8Kq5m8Ckpg@mail.gmail.com>
	<4FAA96FC.30707@balister.org>
In-Reply-To: <4FAA96FC.30707@balister.org>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
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
X-List-Received-Date: Wed, 09 May 2012 16:24:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/09/2012 11:10 AM, Philip Balister wrote:
>
> I guess I need to send my patch to oe-core I use to stop the locatoin
> being hardcoded by the script that comes with oe-core.

Certainly that is another very reasonable approach to the problem.

Assuming it doesn't affect performance (and I can't imagine that it
would), I'll gladly have the oe-core and bitbake at the same level in
the directory hierarchy, and then there is absolutely no need for the
patch to the .gitignore.

Thanks,
Jason.




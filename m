Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SZLpB-0003Ba-IT
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 14:46:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4TCabdm023803
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2012 05:36:37 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 29 May 2012 05:36:37 -0700
Message-ID: <4FC4C2D4.1090608@windriver.com>
Date: Tue, 29 May 2012 07:36:36 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1338294584.20169.103.camel@ted>
In-Reply-To: <1338294584.20169.103.camel@ted>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH] ccache: Separate out into its own class
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
X-List-Received-Date: Tue, 29 May 2012 12:46:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/29/2012 07:29 AM, Richard Purdie wrote:
> Currently, ccache is used if it is present. When building from scratch it gives
> no performance improvement and creates a ton of empty directories even when its
> not in use.
>
> This change moves ccache support to a bbclass file which the user can choose to
> enable. This should make builds more determinstic and make it easier/clearer
> to the end user when its being used and when it is not.

Are the sstate sums the same with and without the use of the new bbclass ccache?

It is not clear to me that this is or is not the case based on this single commit header.

Jason.



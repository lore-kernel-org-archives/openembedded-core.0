Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1RVpbe-0000qt-O3
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 20:14:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAUJ7Prl026153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Nov 2011 11:07:26 -0800 (PST)
Received: from [128.224.21.144] (128.224.21.144) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 30 Nov 2011 11:07:25 -0800
Message-ID: <4ED67EEA.4080800@windriver.com>
Date: Wed, 30 Nov 2011 14:07:22 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: <ulf@emagii.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED6070C.20904@emagii.com>
In-Reply-To: <4ED6070C.20904@emagii.com>
Cc: openembedded-core@openembedded.org
Subject: Re: Adding kernel patches using "git am"?
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
X-List-Received-Date: Wed, 30 Nov 2011 19:14:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11-11-30 05:35 AM, Ulf Samuelsson wrote:
> Is there a reason for using "patch" instead of "git am" on let's say the
> kernel.
>
> If I want to do some modification, of the kernel, I can like Graeme
> description at
> http://www.slimlogic.co.uk/2011/05/openembeddedangstrom-kernel-workflow/ do
> bitbake -c configure virtual/kernel
>
> and then have an initialized git tree ready to be modified.
>
> "git am" is of course more sensitive to the patch quality than "patch"
> but that has some advantages as well.

Not answering the question directly, but if you use the linux-yocto
kernel and related infrastructure, patch is not used to apply changes
to the tree. It is done under the covers with guilt or git am applying
changes to the tree (along with other git operations for more complex 
situations).

Cheers,

Bruce

>
> It also makes the recipe more complex at this stage.
>
> --
> Best Regards
> Ulf Samuelsson
> eMagii
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




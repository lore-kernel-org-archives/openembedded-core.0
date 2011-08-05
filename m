Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpN05-0004bw-H6 for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:11:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75G7SsO013685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:07:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13182-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:07:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75G7Ktn013679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:07:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6f5d9933df00c226e73afe5398613021a6a58133.1312469790.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<6f5d9933df00c226e73afe5398613021a6a58133.1312469790.git.nitin.a.kamble@intel.com>
Date: Fri, 05 Aug 2011 17:06:58 +0100
Message-ID: <1312560418.14274.127.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 08/10] insane.bbclass: add entries for linux-gnu<ABI>
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
X-List-Received-Date: Fri, 05 Aug 2011 16:11:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> for x86_64 multiple ABIs now have these new names for the TARGET_OS.
> Add entries for:
>  linux-gnu32, linux-gnux32, linux-gnu64
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/classes/insane.bbclass |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 5fb0d98..15e7fc7 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -90,6 +90,15 @@ def package_qa_get_machine_dict():
>                          "microblaze":   (47787,  0,    0,          False,         32),
>                          "microblazeel": (47787,  0,    0,          True,          32),
>                        },
> +            "linux-gnu32" :       {
> +                        "x86_64":     (62,     0,    0,          True,          32),
> +                      },

This one doesn't make sense to me. linux-gnu32 would be i586 (arch=3)
and not arch=62?

> +            "linux-gnux32" :       {
> +                        "x86_64":     (62,     0,    0,          True,          32),
> +                      },

This one is fine.

> +            "linux-gnu64" :       {
> +                        "x86_64":     (62,     0,    0,          True,          64),
> +                      },
>         }

I'm not sure we need this either...

Cheers,

Richard





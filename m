Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2F716F7C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:57:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2VHv5ZE016736
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:57:06 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 31 Mar 2014 10:57:05 -0700
Message-ID: <5339AC71.4040103@windriver.com>
Date: Mon, 31 Mar 2014 12:57:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1396259433.git.cristian.iorga@intel.com>	<1396259888.14790.58.camel@ted>	<1396267153.6418.5.camel@firebird.rb.intel.com>	<2505811.xE1RLRgDA1@peggleto-mobl5.ger.corp.intel.com>	<1396285412.14790.83.camel@ted>
	<CAJTo0LbWk+JrhRJwGVtbUJYBYR4qtmCj+tYy8gTnNAqfByGk_w@mail.gmail.com>
In-Reply-To: <CAJTo0LbWk+JrhRJwGVtbUJYBYR4qtmCj+tYy8gTnNAqfByGk_w@mail.gmail.com>
Subject: Re: [PATCH 1/1] core-image-lsb: enforce pam as a needed distro feature
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
X-List-Received-Date: Mon, 31 Mar 2014 17:57:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/14, 12:31 PM, Burton, Ross wrote:
> On 31 March 2014 18:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> I kind of disagree with that, the LSB image can take into account
>> configuration in other parts of the system. If pam isn't configured, I'm
>> not sure that should automatically make it completely unbuildable...
>
> An image that claims to be LSB compliant but due to
> not-immediately-obvious DISTRO_FEATURES isn't actually doesn't seem
> like a good idea to me, fwiw.  If the LSB image requires PAM, X11 and
> so on then it should require the features.

I agree the image with the name LSB should enforce the items it knows the LSB 
depends on.  If the user patches that away then it becomes their issue.

--Mark

> Ross
>



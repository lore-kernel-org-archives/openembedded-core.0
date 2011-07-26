Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qlkhl-0000nq-DP
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:42:01 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2011 09:37:48 -0700
Received: by yxk30 with SMTP id 30so726440yxk.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 09:37:48 -0700 (PDT)
Received: by 10.142.242.11 with SMTP id p11mr3659239wfh.270.1311698267660;
	Tue, 26 Jul 2011 09:37:47 -0700 (PDT)
Received: from [10.1.10.192] (c-67-170-181-205.hsd1.or.comcast.net
	[67.170.181.205])
	by mx.google.com with ESMTPS id q2sm715666pbj.67.2011.07.26.09.37.46
	(version=SSLv3 cipher=OTHER); Tue, 26 Jul 2011 09:37:46 -0700 (PDT)
Message-ID: <4E2EED58.2020004@intel.com>
Date: Tue, 26 Jul 2011 09:37:44 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311671726.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1311671726.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/3] Adding patches to support pam
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
X-List-Received-Date: Tue, 26 Jul 2011 16:42:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2011 03:08 AM, Xiaofeng Yan wrote:
> Hi Saul&  Richard,
>
> I modified my patches about how to whitespace and tab in .bb file according to your suggestion.

Acked-by: Scott Garman <scott.a.garman@intel.com>

for this patch series.

Thank you Yan!

>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/pam
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/pam
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (3):
>    openssh: Support PAM
>    dropbear: Support pam
>    polkit: Support pam
>
>   .../openssh/openssh-5.8p2/sshd                     |   10 ++++++++
>   meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   13 +++++++++-
>   meta/recipes-core/dropbear/dropbear.inc            |    8 ++++++-
>   .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 +++++++++++++++++++
>   meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
>   .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++++++++++++++++
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    7 ++++-
>   7 files changed, 79 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
>   create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



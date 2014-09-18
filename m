Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 86045617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 16:02:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Sep 2014 09:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,548,1406617200"; d="scan'208";a="604885098"
Received: from new-host-2.jf.intel.com (HELO new-host-2.home) ([10.7.201.163])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2014 09:00:55 -0700
Message-ID: <541B01B5.9090900@linux.intel.com>
Date: Thu, 18 Sep 2014 09:00:53 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1411019338.git.Qi.Chen@windriver.com>
	<cbcf90ef7466703fd5015923cb6d1b3998ee9a95.1411019338.git.Qi.Chen@windriver.com>
In-Reply-To: <cbcf90ef7466703fd5015923cb6d1b3998ee9a95.1411019338.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] dhcp: set Type=forking for dhcpd.service
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
X-List-Received-Date: Thu, 18 Sep 2014 16:02:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2014 10:50 PM, Chen Qi wrote:
> Set Type=forking for dhcpd.service to make it start up correctly.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-connectivity/dhcp/files/dhcpd.service | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd.service b/meta/recipes-connectivity/dhcp/files/dhcpd.service
> index 8648f1a..80f6c41 100644
> --- a/meta/recipes-connectivity/dhcp/files/dhcpd.service
> +++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
> @@ -4,6 +4,7 @@ After=network.target
>   After=time-sync.target
>
>   [Service]
> +Type=forking

Is it possible to set "PIDFile=" as well? There can be some weird 
behaviour if systemd loses track of the child process.

>   EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
>   ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
>
>



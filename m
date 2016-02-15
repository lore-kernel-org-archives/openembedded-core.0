Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4296B7317F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 19:47:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 15 Feb 2016 11:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,452,1449561600"; d="scan'208";a="746836510"
Received: from besquive-mobl2.zpn.intel.com ([10.219.128.114])
	by orsmga003.jf.intel.com with ESMTP; 15 Feb 2016 11:47:59 -0800
Message-ID: <1455565695.19294.14.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1455563442-11586-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1455563442-11586-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Organization: Intel Corporation
Date: Mon, 15 Feb 2016 13:48:15 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Subject: Re: [PATCHv2 1/2] oeqa/utils: added new networke module
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
X-List-Received-Date: Mon, 15 Feb 2016 19:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paco, please fix the typo in the subject as it is the typo of the
commit title as well.

Check my other comments below and re-send.

On Mon, 2016-02-15 at 13:10 -0600, Francisco Pedraza wrote:
> A network module was added, and will contain network utility funcions
> for now.
fix typo in 'functions'
> with get_free_port that returns availabe network port in the system.
fix typo in 'available'
> 
> Signed-off-by: Francisco Pedraza <
> francisco.j.pedraza.gonzalez@intel.com>
> ---
>  meta/lib/oeqa/utils/network.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta/lib/oeqa/utils/network.py
> 
> diff --git a/meta/lib/oeqa/utils/network.py
> b/meta/lib/oeqa/utils/network.py
> new file mode 100644
> index 0000000..2768f6c
> --- /dev/null
> +++ b/meta/lib/oeqa/utils/network.py
> @@ -0,0 +1,8 @@
> +import socket
> +
> +def get_free_port():
> +    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> +    s.bind(('', 0))
> +    addr = s.getsockname()
> +    s.close()
> +    return addr[1]
> -- 
> 2.5.0
> 


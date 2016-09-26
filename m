Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E1F5E6FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 15:47:41 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1boY86-0003qw-BL from Nathan_Lynch@mentor.com ;
	Mon, 26 Sep 2016 08:47:42 -0700
Received: from [172.30.80.91] (147.34.91.1) by SVR-ORW-FEM-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 26 Sep 2016 08:47:41 -0700
To: <liu.ming50@gmail.com>
References: <1474628333-28806-1-git-send-email-liu.ming50@gmail.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <ff521696-f544-ed26-7d2f-ebcbf3f61fa1@mentor.com>
Date: Mon, 26 Sep 2016 10:47:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474628333-28806-1-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-tools: fixes a wrong header issue
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
X-List-Received-Date: Mon, 26 Sep 2016 15:47:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 09/23/2016 05:58 AM, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> This fixes a following compiling issue:
> | agent.c:33:19: fatal error: error.h: No such file or directory
> |  #include "error.h"
> 
> it's back-ported from lttng-tools upstream, we need it in SRC_URI
> since 2.8 is still the latest release.
> 

[...]

> + src/bin/lttng-sessiond/agent.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/bin/lttng-sessiond/agent.c b/src/bin/lttng-sessiond/agent.c
> +index 7cbbbde..310a7e8 100644
> +--- a/src/bin/lttng-sessiond/agent.c
> ++++ b/src/bin/lttng-sessiond/agent.c
> +@@ -29,7 +29,7 @@
> + #include "agent.h"
> + #include "ust-app.h"
> + #include "utils.h"
> +-#include "error.h"
> ++#include "common/error.h"
> + 
> + #define AGENT_RET_CODE_INDEX(code) (code - AGENT_RET_CODE_SUCCESS)
> + 
> +--

This is fixing an issue that doesn't look like it would be
configuration-dependent; how was the build error provoked?  I've never
seen it.




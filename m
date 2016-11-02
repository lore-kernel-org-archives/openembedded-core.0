Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B19AA6078D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 19:43:43 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1c21Ro-0001C9-TQ from Nathan_Lynch@mentor.com ;
	Wed, 02 Nov 2016 12:43:44 -0700
Received: from [172.30.80.149] (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 2 Nov 2016 12:43:41 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20161102170928.14841-1-alexander.kanavin@linux.intel.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <3f582e31-2d2e-caa6-2937-afbab345e88c@mentor.com>
Date: Wed, 2 Nov 2016 13:43:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161102170928.14841-1-alexander.kanavin@linux.intel.com>
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] lttng-tools: do not install shared libraries in ptest package
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
X-List-Received-Date: Wed, 02 Nov 2016 19:43:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/02/2016 11:09 AM, Alexander Kanavin wrote:
> This was creating a race in runtime library dependency resolution
> where sometimes the library was assumed to be provided by the ptest
> package.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>

FWIW:

Acked-by: Nathan Lynch <nathan_lynch@mentor.com>

Can this be applied to the morty branch after it hits master?



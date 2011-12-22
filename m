Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RdlMf-0008Pp-0C
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 17:19:29 +0100
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Dec 2011 08:12:20 -0800
Received: by ggnq1 with SMTP id q1so6108629ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 08:12:19 -0800 (PST)
Received: by 10.50.15.161 with SMTP id y1mr11065230igc.4.1324570339476;
	Thu, 22 Dec 2011 08:12:19 -0800 (PST)
Received: from [192.168.1.12] (c-76-115-40-64.hsd1.or.comcast.net.
	[76.115.40.64])
	by mx.google.com with ESMTPS id g34sm30448562ibk.10.2011.12.22.08.12.17
	(version=SSLv3 cipher=OTHER); Thu, 22 Dec 2011 08:12:18 -0800 (PST)
Message-ID: <4EF356EF.7080703@intel.com>
Date: Thu, 22 Dec 2011 08:12:31 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324540322.git.sgw@linux.intel.com>
	<be1461e4a665328a3f97fb6e516cfce663b1c48d.1324540323.git.sgw@linux.intel.com>
	<1324543857.4492.15.camel@lenovo.internal.reciva.com>
In-Reply-To: <1324543857.4492.15.camel@lenovo.internal.reciva.com>
Subject: Re: [CONSOLIDATED PULL 12/26] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Thu, 22 Dec 2011 16:19:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 12:50 AM, Phil Blundell wrote:
> On Wed, 2011-12-21 at 23:55 -0800, Saul Wold wrote:
>> +BUILD_LDFLAGS += "-Wl,-rpath,${base_libdir}"
>
> Why is that required?

It's actually needed only for the -native case, so that the tic command 
(and possibly others) can be run.

I take it I should have done:

BUILD_LDFLAGS_virtclass_native +=

instead?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



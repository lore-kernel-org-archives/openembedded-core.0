Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RdxpX-0000q5-Mh
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 06:38:07 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 22 Dec 2011 21:30:59 -0800
Received: by iazz13 with SMTP id z13so12613237iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 21:30:58 -0800 (PST)
Received: by 10.50.195.129 with SMTP id ie1mr11737154igc.29.1324618258533;
	Thu, 22 Dec 2011 21:30:58 -0800 (PST)
Received: from [192.168.1.12] (c-76-115-40-64.hsd1.or.comcast.net.
	[76.115.40.64])
	by mx.google.com with ESMTPS id h9sm37014205ibh.11.2011.12.22.21.30.57
	(version=SSLv3 cipher=OTHER); Thu, 22 Dec 2011 21:30:57 -0800 (PST)
Message-ID: <4EF41210.5090403@intel.com>
Date: Thu, 22 Dec 2011 21:30:56 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324540322.git.sgw@linux.intel.com>
	<be1461e4a665328a3f97fb6e516cfce663b1c48d.1324540323.git.sgw@linux.intel.com>
	<1324543857.4492.15.camel@lenovo.internal.reciva.com>
	<4EF356EF.7080703@intel.com>
In-Reply-To: <4EF356EF.7080703@intel.com>
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
X-List-Received-Date: Fri, 23 Dec 2011 05:38:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 08:12 AM, Scott Garman wrote:
> On 12/22/2011 12:50 AM, Phil Blundell wrote:
>> On Wed, 2011-12-21 at 23:55 -0800, Saul Wold wrote:
>>> +BUILD_LDFLAGS += "-Wl,-rpath,${base_libdir}"
>>
>> Why is that required?
>
> It's actually needed only for the -native case, so that the tic command
> (and possibly others) can be run.
>
> I take it I should have done:
>
> BUILD_LDFLAGS_virtclass_native +=

Having tested this, it actually doesn't work.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



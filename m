Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RCLL0-0003Ru-6M
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 03:04:32 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 07 Oct 2011 17:57:42 -0700
Received: by ywp31 with SMTP id 31so7847191ywp.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 17:57:42 -0700 (PDT)
Received: by 10.68.209.37 with SMTP id mj5mr17366349pbc.123.1318035461885;
	Fri, 07 Oct 2011 17:57:41 -0700 (PDT)
Received: from [192.168.1.103] (c-98-246-165-28.hsd1.or.comcast.net.
	[98.246.165.28])
	by mx.google.com with ESMTPS id ki1sm36765143pbb.3.2011.10.07.17.57.39
	(version=SSLv3 cipher=OTHER); Fri, 07 Oct 2011 17:57:39 -0700 (PDT)
Message-ID: <4E8FA001.4000702@intel.com>
Date: Fri, 07 Oct 2011 17:57:37 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1317946258.git.julian.pidancet@gmail.com>
In-Reply-To: <cover.1317946258.git.julian.pidancet@gmail.com>
Subject: Re: [PATCH v3 0/2] Fix useradd class to accept useradd long options
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
X-List-Received-Date: Sat, 08 Oct 2011 01:04:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2011 05:13 PM, Julian Pidancet wrote:
> This first patch fixes the --root option for programs in shadow-native and
> allow one to specify useradd long options when using the useradd class
> in a recipe.
>
> The second patch demonstrates usage of the useradd class and ability to
> specify long options in the USERADD_PARAM variable by converting the OpenSSH
> recipe to useradd.
>
> v2: Fixed a typo in add_root_cmd_options.patch, --root is equivalent to -Q
> instead of -R.
>
> v3: Comment modifications and add Signed-off-by line in the modified patch
> directly.

Thank you Julian for these fixes.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



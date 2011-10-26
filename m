Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJ9dx-00030X-UL
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:00:13 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 12:54:08 -0700
Received: by wwe6 with SMTP id 6so2156005wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 12:54:07 -0700 (PDT)
Received: by 10.216.14.2 with SMTP id c2mr109952wec.15.1319658847321;
	Wed, 26 Oct 2011 12:54:07 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id fi11sm5081891wbb.9.2011.10.26.12.54.05
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 12:54:06 -0700 (PDT)
Message-ID: <4EA8655C.1040206@intel.com>
Date: Wed, 26 Oct 2011 21:54:04 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/8] Subversion-1.7.0 and arm/thumb work arounds
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
X-List-Received-Date: Wed, 26 Oct 2011 20:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 10:17 AM, Martin Jansa wrote:
> Hi,
>
> arm mode was forced without PR bump, because if it was failing for someone he
> will notice.
>
> Be carefull with using subversion-1.7.0 (read the commit message).
>
> Pulseaudio-1.1 was released, so hopefully this work arounds won't be needed
> there or they could be resolved better with upgrade.
>
> Regards,
>
> The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:
>
>    distro-tracking-fields: update fields for tzdata and gst-plugins-good (2011-10-20 13:07:16 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2
>
> Martin Jansa (8):
>    pulseaudio-0.9.23: inherit perlnative to work around build on host
>      without XML/Parser.pm
>    libatomics-ops: force ARM mode
>    pulseaudio-0.9.23: force ARM mode
>    webkit-gtk: force arm mode to work around binutils segfault
>    apr: add native support
>    neon: add native support
>    apr-util: add native support
>    subversion: add 1.7.0 with native support and negative D_P for now
>
Of the above patches, the pulse audio and adding native support for apr, 
neon and apr-util were taken, the other are on hold pending different 
solutions.

Thanks

Sau!

>   .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++++++++
>   .../subversion/subversion_1.7.0.bb                 |   37 ++++++++++++++++++++
>   .../pulseaudio/libatomics-ops_1.2.bb               |    2 +
>   .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
>   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |   17 +++++++++
>   meta/recipes-support/apr/apr-util_1.3.12.bb        |    8 ++++
>   meta/recipes-support/apr/apr_1.4.5.bb              |    2 +
>   meta/recipes-support/neon/neon_0.29.5.bb           |    3 ++
>   8 files changed, 86 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
>




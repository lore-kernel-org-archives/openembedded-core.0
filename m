Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RzvA6-0002tq-J9
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:14:06 +0100
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Feb 2012 11:04:42 -0800
Received: by dado14 with SMTP id o14so28262166dad.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 11:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of saul.wold@intel.com designates
	10.68.218.231 as permitted sender) client-ip=10.68.218.231; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of saul.wold@intel.com
	designates 10.68.218.231 as permitted sender)
	smtp.mail=saul.wold@intel.com
Received: from mr.google.com ([10.68.218.231])
	by 10.68.218.231 with SMTP id pj7mr78466044pbc.63.1329851081990
	(num_hops = 1); Tue, 21 Feb 2012 11:04:41 -0800 (PST)
Received: by 10.68.218.231 with SMTP id pj7mr64616163pbc.63.1329851081943;
	Tue, 21 Feb 2012 11:04:41 -0800 (PST)
Received: from [10.6.18.245] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id f3sm16721364pbr.61.2012.02.21.11.04.40
	(version=SSLv3 cipher=OTHER); Tue, 21 Feb 2012 11:04:41 -0800 (PST)
Message-ID: <4F43EAC7.10300@intel.com>
Date: Tue, 21 Feb 2012 11:04:39 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329230985.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1329230985.git.dexuan.cui@intel.com>
X-Gm-Message-State: ALoCoQlFxk/cin52Tc5eJW40rfW/vUYNWHJsUJISI+i28y0uDgfeKr/b06HqN+5YQI2PRcY29V3x
Subject: Re: [PATCH 0/2] self-hosted-image: 2 new patches from Dexuan: Feb 14, 2012
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
X-List-Received-Date: Tue, 21 Feb 2012 19:14:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2012 06:51 AM, Dexuan Cui wrote:
> The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:
>
>    guile: fix cross configure failure (2012-02-10 17:01:42 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/self-hosted-v8
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self-hosted-v8
>
> Dexuan Cui (2):
>    mini-x-session: try to use a resolution that's big enough for hob2's
>      window
>    task-self-hosted: add connman and connman-plugin-ethernet
>
>   meta/recipes-core/tasks/task-self-hosted.bb        |    4 +++-
>   .../mini-x-session/files/mini-x-session            |    4 ++++
>   .../mini-x-session/mini-x-session_0.1.bb           |    2 ++
>   3 files changed, 9 insertions(+), 1 deletions(-)
>

Merged into OE-core

Thanks
	Sau!



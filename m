Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 9215077777
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 101ED1EEC22F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 11:43:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id LRjF8vWafJ+g
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 11:43:05 +0200 (CEST)
Received: from [10.5.19.152] (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPSA id B093B1EEC225
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 11:43:05 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1473240119.git.Qi.Chen@windriver.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <621695fd-046c-4130-d89a-913bc0cae709@smile.fr>
Date: Wed, 7 Sep 2016 11:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1473240119.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 0/3] systemd: add support to manage user units
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
X-List-Received-Date: Wed, 07 Sep 2016 09:43:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

It's probably worth updating the documentation too... this is a usefull 
feature and it deserves the exposure


Regards

Jeremy Rosen


On 07/09/2016 11:22, Chen Qi wrote:
> The following changes since commit 55bb6816aca39bfa25d4f7e2158a57a5f0ac1cca:
>
>    oeqa.buildperf: correct globalres time format (2016-09-06 10:24:00 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-user-units
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-user-units
>
> Chen Qi (3):
>    systemd-systemctl: add option to manage user services
>    systemd.bbclass: add support to manage user services
>    pulseaudio: fix to manage user services corretly
>
>   meta/classes/systemd.bbclass                       | 17 ++++++--
>   .../systemd/systemd-systemctl/systemctl            | 45 ++++++++++++++--------
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  4 +-
>   3 files changed, 43 insertions(+), 23 deletions(-)
>



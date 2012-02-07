Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RujLu-0002Xp-Px
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 12:36:50 +0100
Received: by qadz30 with SMTP id z30so2914499qad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 03:28:48 -0800 (PST)
Received: by 10.224.31.69 with SMTP id x5mr20780275qac.21.1328614128333;
	Tue, 07 Feb 2012 03:28:48 -0800 (PST)
Received: from [128.224.170.202] ([89.121.200.106])
	by mx.google.com with ESMTPS id fi8sm40238428qab.21.2012.02.07.03.28.46
	(version=SSLv3 cipher=OTHER); Tue, 07 Feb 2012 03:28:47 -0800 (PST)
Message-ID: <4F310AEE.3050606@gherzan.ro>
Date: Tue, 07 Feb 2012 13:28:46 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <1328613884-19288-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1328613884-19288-1-git-send-email-andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] js: Update to v1.8.5
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
X-List-Received-Date: Tue, 07 Feb 2012 11:36:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2012 01:24 PM, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> Signed-off-by: Sergey 'Jin' Bostandzhyan<jin@mediatomb.cc>
> ---
>   meta/recipes-support/js/files/buildcc.patch       |   22 ------
>   meta/recipes-support/js/files/configure.ac        |   28 --------
>   meta/recipes-support/js/files/jsautocfg.h         |   74 ---------------------
>   meta/recipes-support/js/files/link_with_gcc.patch |   15 ----
>   meta/recipes-support/js/files/usepic.patch        |   26 -------
>   meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb      |   50 --------------
>   meta/recipes-support/js/js_1.8.5.bb               |   50 ++++++++++++++
>   7 files changed, 50 insertions(+), 215 deletions(-)
>   delete mode 100644 meta/recipes-support/js/files/buildcc.patch
>   delete mode 100644 meta/recipes-support/js/files/configure.ac
>   delete mode 100644 meta/recipes-support/js/files/jsautocfg.h
>   delete mode 100644 meta/recipes-support/js/files/link_with_gcc.patch
>   delete mode 100644 meta/recipes-support/js/files/usepic.patch
>   delete mode 100644 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
>   create mode 100644 meta/recipes-support/js/js_1.8.5.bb
I uploaded only 1/3 and 2/3 patches because 3/3 is the patch for socat 
update. Saul already provided feedback about this. Sorry for creating 
this confusion.

@g



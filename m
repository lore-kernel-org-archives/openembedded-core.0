Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDBx4-0003HT-Pf for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 11:15:14 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9G5eR008242; Mon, 10 Oct 2011 10:16:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 64idA+Rb5l0L; Mon, 10 Oct 2011 10:16:04 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9G2kD008239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 10 Oct 2011 10:16:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 10:09:22 +0100
In-Reply-To: <cover.1317946258.git.julian.pidancet@gmail.com>
References: <cover.1317946258.git.julian.pidancet@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318237770.23801.3.camel@ted>
Mime-Version: 1.0
Cc: julian.pidancet@gmail.com
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
X-List-Received-Date: Mon, 10 Oct 2011 09:15:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-07 at 01:13 +0100, Julian Pidancet wrote:
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
> 
> Julian Pidancet (2):
>   Fix the --root option in shadow-native programs
>   Use useradd and update-rc.d classes in the OpenSSH recipe

Merged to master, thanks.

Richard




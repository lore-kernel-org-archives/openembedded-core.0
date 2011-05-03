Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1QHNCU-0007zh-2g
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 23:32:10 +0200
Received: by bwz5 with SMTP id 5so560085bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 14:29:32 -0700 (PDT)
Received: by 10.204.25.20 with SMTP id x20mr334105bkb.112.1304458172188; Tue,
	03 May 2011 14:29:32 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.204.54.80 with HTTP; Tue, 3 May 2011 14:29:11 -0700 (PDT)
X-Originating-IP: [95.29.102.212]
In-Reply-To: <4DBF1D59.2050506@windriver.com>
References: <4DBF1D59.2050506@windriver.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Wed, 4 May 2011 01:29:11 +0400
X-Google-Sender-Auth: ie9xT0zK2SvtVQg8F25WpBgA9Ck
Message-ID: <BANLkTinExi7U9S2M6qzkTB62zYeuGE-4eA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Recipe based User & Group addition, modification and deletion
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
X-List-Received-Date: Tue, 03 May 2011 21:32:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/3 Mark Hatle <mark.hatle@windriver.com>:
> RFC: Recipe based User & Group addition, modification and deletion

[skip]

> Any comments on the above?

As a former FreeBSD admin I'll show how this is done in 'ports'
collection (JFYI):

# USERS			- List of users to create at install time. Each login must
# 				  have a corresponding entry in ${UID_FILES}.
# GROUPS		- List of groups to create at install time. Each group must
# 				  have a corresponding entry in ${GID_FILES}.

Sample usage from databases/mysql51-server/Makefile:
USERS=          mysql
GROUPS=         mysql

UID_FILES and GID_FILES are pointing to UIDs and GIDs files in ports dir.

Sample record from UIDs file:
mysql:*:88:88::0:0:MySQL Daemon:/var/db/mysql:/usr/sbin/nologin

Sample record from GIDs file:
mysql:*:88:

-- 
Yury Bushmelev



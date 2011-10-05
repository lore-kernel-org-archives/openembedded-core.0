Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1RBP76-0002QZ-5H
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 12:54:12 +0200
Received: by eya25 with SMTP id 25so1510551eya.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 03:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=9XV60JP6IgDhtNuk+iogYwvYNnwYsfmgU0L0qXkdmgY=;
	b=Uf5GZftxMFT4lZk6/vDYD/QCzMBp2tFlpm6TPJtIEaxVZmIgTBu6nF3GE71epCwPYW
	ygftYP63+sU0OX4si1oS2T75qIUBdsBXSXR9h4chKiWaWJ9UBe3XzyNflGI9OCttiZba
	ZfV5DPkzRUy1Sdy4rtZYMVWEgvYIyYTtjtSuw=
Received: by 10.213.22.141 with SMTP id n13mr1111770ebb.120.1317811717065;
	Wed, 05 Oct 2011 03:48:37 -0700 (PDT)
Received: from [192.168.0.111] (147.84-49-231.nextgentel.com. [84.49.231.147])
	by mx.google.com with ESMTPS id 69sm96342eeh.7.2011.10.05.03.48.35
	(version=SSLv3 cipher=OTHER); Wed, 05 Oct 2011 03:48:36 -0700 (PDT)
Message-ID: <4E8C3603.9000803@gmail.com>
Date: Wed, 05 Oct 2011 12:48:35 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Workaround to compile linux-omap_2.6.39.bb?
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
X-List-Received-Date: Wed, 05 Oct 2011 10:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I need to compile linux-omap_2.6.39.bb, but it fails since the 
tmlind-repos are not currently on kernel.org.

I have downloaded 
git_git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux-omap-2.6.git_v2.6.39.tar.gz 
from the angstrom mirrors. Can I extract that into my downloads/ in a 
way that will make bitbake find and accept it?

- Tasslehoff



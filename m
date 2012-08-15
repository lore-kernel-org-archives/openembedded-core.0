Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=567b62d7c=rich.pixley@palm.com>)
	id 1T1kaF-0008Qe-1V for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 22:52:55 +0200
X-IronPort-AV: E=Sophos;i="4.77,774,1336374000"; d="scan'208,217";a="15336333"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 15 Aug 2012 13:39:52 -0700
Received: from flamingo.palm.com ([148.92.244.134])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q7FKdqqj019713;
	Wed, 15 Aug 2012 13:39:52 -0700
Message-ID: <502C0918.5010106@palm.com>
Date: Wed, 15 Aug 2012 13:39:52 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120808 Thunderbird/15.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: PREMIRROR question...
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
X-List-Received-Date: Wed, 15 Aug 2012 20:52:55 -0000
Content-Type: multipart/alternative;
	boundary="------------070505000103070007000301"

--------------070505000103070007000301
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

If I build core-image-minimal with BB_GENERATE_MIRROR_TARBALLS := "1"... 
in my local.conf....

And then I start a second build, with:

SOURCE_MIRROR_URL := "file://.../firstbuild/.../downloads"
INHERIT += "own-mirrors"
BB_FETCH_PREMIRRORONLY := "1"
BB_NO_NETWORK := "1"

It fails almost immediately for failure to fetch quilt source, (which 
/does/ exist in the previous build's .../downloads). Apparently the 
"build first" build of pseudo doesn't pick up these settings?

Is this intentional?

--rich



--------------070505000103070007000301
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    If I build core-image-minimal with BB_GENERATE_MIRROR_TARBALLS :=
    "1"... in my local.conf....<br>
    <br>
    And then I start a second build, with:<br>
    <br>
    SOURCE_MIRROR_URL := <a class="moz-txt-link-rfc2396E" href="file://.../firstbuild/.../downloads">"file://.../firstbuild/.../downloads"</a><br>
    INHERIT += "own-mirrors"<br>
    BB_FETCH_PREMIRRORONLY := "1"<br>
    BB_NO_NETWORK := "1"<br>
    <br>
    It fails almost immediately for failure to fetch quilt source,
    (which <i>does</i> exist in the previous build's .../downloads).&nbsp;
    Apparently the "build first" build of pseudo doesn't pick up these
    settings?<br>
    <br>
    Is this intentional?<br>
    <br>
    --rich<br>
    <br>
    <br>
  </body>
</html>

--------------070505000103070007000301--

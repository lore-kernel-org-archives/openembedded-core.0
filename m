Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5045700F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 08:28:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8M8SIu2028003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 22 Sep 2017 01:28:18 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 22 Sep 2017 01:28:16 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Li Zhou <li.zhou@windriver.com>
References: <1496654112-103612-1-git-send-email-li.zhou@windriver.com>
	<CAJTo0LY90JXpc4Af8qY-fU-LjX9PFFwg3rHvYrXKO5yGspL04g@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <e1ded094-49f2-eb27-a529-e1bbadd32cc2@windriver.com>
Date: Fri, 22 Sep 2017 16:27:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY90JXpc4Af8qY-fU-LjX9PFFwg3rHvYrXKO5yGspL04g@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python2/3: Remove building host path from packages
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
X-List-Received-Date: Fri, 22 Sep 2017 08:28:18 -0000
Content-Type: multipart/alternative;
	boundary="------------4E8FD205F42D5AA6C0B69ECA"
Content-Language: en-US

--------------4E8FD205F42D5AA6C0B69ECA
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

The libxml2 ,python3-dbus and gpgme used host include and/or library 
paths, if we

remove those host paths in the end of do_install task, those host paths 
would not

populate in sysroot, so it's better to put the removing action in 
PACKAGE_PREPROCESS_FUNCS.


On 2017年06月08日 21:36, Burton, Ross wrote:
>
> I think the seds need to be moved earlier in the build, or that py 
> file recompiled.


--------------4E8FD205F42D5AA6C0B69ECA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>The libxml2 ,python3-dbus and gpgme used host include and/or
      library paths, if we</p>
    <p>remove those host paths in the end of do_install task, those host
      paths would not</p>
    <p>populate in sysroot, so it's better to put the removing action in
      PACKAGE_PREPROCESS_FUNCS.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017年06月08日 21:36, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LY90JXpc4Af8qY-fU-LjX9PFFwg3rHvYrXKO5yGspL04g@mail.gmail.com">
      <div class="gmail_extra"><br>
      </div>
      <div class="gmail_extra">I think the seds need to be moved earlier
        in the build, or that py file recompiled.</div>
    </blockquote>
    <br>
  </body>
</html>

--------------4E8FD205F42D5AA6C0B69ECA--

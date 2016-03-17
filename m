Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C277C6012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 09:35:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2H9Zk74017812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 17 Mar 2016 02:35:46 -0700
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 17 Mar 2016 02:35:45 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1458096408.git.dengke.du@windriver.com>
	<7f65eb60b218d156262f426460a2873ecdb32a14.1458096408.git.dengke.du@windriver.com>
	<CAJTo0LaGJyuoNL7V=y1+tCWWZQV1DuNAEeQSfoTgkieGrNRkLA@mail.gmail.com>
	<4132846.MxUMxyiN00@peggleto-mobl.ger.corp.intel.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <56EA7A6E.70401@windriver.com>
Date: Thu, 17 Mar 2016 17:35:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <4132846.MxUMxyiN00@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH 1/1] nativesdk-coreutils: a lot of warnings fixed
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
X-List-Received-Date: Thu, 17 Mar 2016 09:35:50 -0000
Content-Type: multipart/alternative;
	boundary="------------030306010206000507090106"

--------------030306010206000507090106
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

After a talk with Hongxu jia, we decided to change the 
do_install_append_class-target()
to do_install_append(), in this function, added the following:
if [ "${CLASSOVERRIDE}" = "class-native" ]; then
                 return
          fi
in this way, avoid the conflict with the following 
do_install_append_class-native function.

//dengke
On 2016年03月17日 05:52, Paul Eggleton wrote:
> On Wed, 16 Mar 2016 21:30:35 Burton, Ross wrote:
>> On 16 March 2016 at 02:49, Dengke Du <dengke.du@windriver.com> wrote:
>>> When we create nativesdk-coreutils, a lot of warnings appear,it
>>> show many files can't find.
>> I don't think anywhere where nativesdk packages are used actually runs the
>> postinst scripts to create the alternative links, so maybe we should be
>> stopping update-alternatives do anything in nativesdk (just like it doesn't
>> do anything for native)?
> Actually I checked this by adding a dummy line which creates a file in $D to
> the dbus postinst and then adding nativesdk-dbus to buildtools-tarball - it
> seems that the postinst does actually get run. As long as the postinst can
> successfully run at SDK construction time then apparently it should work.
>
> Cheers,
> Paul
>


--------------030306010206000507090106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    After a talk with Hongxu jia, we decided to change the
    do_install_append_class-target()<br>
    to do_install_append(), in this function, added the following:<br>
             <font color="#3366ff">if [ "${CLASSOVERRIDE}" =
      "class-native" ]; then<br>
                      return<br>
               fi<br>
      <font color="#000000">in this way, avoid the conflict with the
        following do_install_append_class-native function.<br>
        <br>
      </font></font>//dengke<br>
    <div class="moz-cite-prefix">On 2016年03月17日 05:52, Paul Eggleton
      wrote:<br>
    </div>
    <blockquote
      cite="mid:4132846.MxUMxyiN00@peggleto-mobl.ger.corp.intel.com"
      type="cite">
      <pre wrap="">On Wed, 16 Mar 2016 21:30:35 Burton, Ross wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 16 March 2016 at 02:49, Dengke Du <a class="moz-txt-link-rfc2396E" href="mailto:dengke.du@windriver.com">&lt;dengke.du@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">When we create nativesdk-coreutils, a lot of warnings appear,it
show many files can't find.
</pre>
        </blockquote>
        <pre wrap="">
I don't think anywhere where nativesdk packages are used actually runs the
postinst scripts to create the alternative links, so maybe we should be
stopping update-alternatives do anything in nativesdk (just like it doesn't
do anything for native)?
</pre>
      </blockquote>
      <pre wrap="">
Actually I checked this by adding a dummy line which creates a file in $D to 
the dbus postinst and then adding nativesdk-dbus to buildtools-tarball - it 
seems that the postinst does actually get run. As long as the postinst can 
successfully run at SDK construction time then apparently it should work.

Cheers,
Paul

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030306010206000507090106--

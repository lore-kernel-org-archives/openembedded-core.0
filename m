Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TYj3K-0002RW-4l
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 20:55:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2012 11:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; 
	d="scan'208,217";a="242265947"
Received: from elitebook.jf.intel.com (HELO [10.7.202.56]) ([10.7.202.56])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2012 11:41:17 -0800
Message-ID: <50A3F3DD.1060900@intel.com>
Date: Wed, 14 Nov 2012 21:41:17 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
	<CAP9ODKoavTz3NHir+XCx9GKCZg5qQicqzTxdaQxPr0fk-9Qbfg@mail.gmail.com>
In-Reply-To: <CAP9ODKoavTz3NHir+XCx9GKCZg5qQicqzTxdaQxPr0fk-9Qbfg@mail.gmail.com>
Cc: Alexandru Damian <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] initrd: add recovery feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 19:55:14 -0000
Content-Type: multipart/alternative;
	boundary="------------030704000006070707040008"

--------------030704000006070707040008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2012 03:30 AM, Otavio Salvador wrote:
>
>
> On Tue, Nov 13, 2012 at 7:12 PM, Radu Moisan <radu.moisan@intel.com 
> <mailto:radu.moisan@intel.com>> wrote:
>
>     Allows you to use as root a partition instead of the rootfs.img
>     for recovering an old install, and fails safe when no rootfs is
>     found, dropping the user to a shell if something goes wrong.
>
>     Signed-off-by: Radu Moisan <radu.moisan@intel.com
>     <mailto:radu.moisan@intel.com>>
>     Signed-off-by: Alexandru Damian <alexandru.damian@intel.com
>     <mailto:alexandru.damian@intel.com>>
>     ---
>      meta/recipes-core/initrdscripts/files/init-live.sh |   44
>     +++++++++++++++++++-
>      1 file changed, 42 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh
>     b/meta/recipes-core/initrdscripts/files/init-live.sh
>     index 5682fd1..81686b9 100644
>     --- a/meta/recipes-core/initrdscripts/files/init-live.sh
>     +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
>     @@ -68,13 +68,49 @@ fatal() {
>
>      early_setup
>
>     +# wait for the udevd to settle
>     +echo "Waiting for udev to settle..."
>     +udevadm settle --timeout=3
>
>
> I think if we take a timeout it needs to be about 10s or 20s. I have 
> some slow machines that take way more time then 3s.
This is more reasonable then just removing the timeout.

Radu

--------------030704000006070707040008
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/14/2012 03:30 AM, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAP9ODKoavTz3NHir+XCx9GKCZg5qQicqzTxdaQxPr0fk-9Qbfg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <br>
      <br>
      <div class="gmail_quote">On Tue, Nov 13, 2012 at 7:12 PM, Radu
        Moisan <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:radu.moisan@intel.com" target="_blank">radu.moisan@intel.com</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          Allows you to use as root a partition instead of the
          rootfs.img<br>
          for recovering an old install, and fails safe when no rootfs
          is<br>
          found, dropping the user to a shell if something goes wrong.<br>
          <br>
          Signed-off-by: Radu Moisan &lt;<a moz-do-not-send="true"
            href="mailto:radu.moisan@intel.com">radu.moisan@intel.com</a>&gt;<br>
          Signed-off-by: Alexandru Damian &lt;<a moz-do-not-send="true"
            href="mailto:alexandru.damian@intel.com">alexandru.damian@intel.com</a>&gt;<br>
          ---<br>
          &nbsp;meta/recipes-core/initrdscripts/files/init-live.sh | &nbsp; 44
          +++++++++++++++++++-<br>
          &nbsp;1 file changed, 42 insertions(+), 2 deletions(-)<br>
          <br>
          diff --git
          a/meta/recipes-core/initrdscripts/files/init-live.sh
          b/meta/recipes-core/initrdscripts/files/init-live.sh<br>
          index 5682fd1..81686b9 100644<br>
          --- a/meta/recipes-core/initrdscripts/files/init-live.sh<br>
          +++ b/meta/recipes-core/initrdscripts/files/init-live.sh<br>
          @@ -68,13 +68,49 @@ fatal() {<br>
          <br>
          &nbsp;early_setup<br>
          <br>
          +# wait for the udevd to settle<br>
          +echo "Waiting for udev to settle..."<br>
          +udevadm settle --timeout=3<br>
        </blockquote>
        <div><br>
        </div>
        <div>I think if we take a timeout it needs to be about 10s or
          20s. I have some slow machines that take way more time then
          3s.</div>
        <div>&nbsp;</div>
      </div>
    </blockquote>
    This is more reasonable then just removing the timeout.<br>
    <br>
    Radu <br>
  </body>
</html>

--------------030704000006070707040008--

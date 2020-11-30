Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.60835.1606747254059463885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 06:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B2F+Y6hj;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id t143so14332270oif.10
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 06:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=uT9+uDwr/OfUJdjTVsUEaq7YBxs2BAspuyEYH2u4bxE=;
        b=B2F+Y6hjddXCkUL4yoiBYXqfaNSf47i63rPd4dOUl4e1NJ8CIHzvTGTe0Pa3pjZ/jM
         YTNK/ePGLSEpCx/XAw8buQxT8AyL6JV4D2pFmps+9my36RJDjsCyzXmZ7k+I+emV9CnT
         kujkeIv7R6oq9RR4jGq0MV1NH8iDKIRhGQjB3er1AbcuGay3kzpXr+Qys5objK/MUcjx
         t5BfETFZbXk7BLQghQK5AJv9V5zGApqHWSdImd9QCy5y/tevqqOWly+0YoHDajUa2z4+
         pPqzzk/+BLKHMT2SYhGmhf9Sl29jtI+46X12BgDqLKQp7z+q1tvvGlcgV6/e9l4FB2AJ
         6sQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=uT9+uDwr/OfUJdjTVsUEaq7YBxs2BAspuyEYH2u4bxE=;
        b=IhzvxMBDUgIQACtctD1ICbcZcvHXaO8rH1jR8RJsXR3rg4e0HDgAxYQERMsZDrdqZW
         C+y4CI3wQYehiAE4bqN4OjXHYuIHYvmT6CRHHu1ugEWHMzKKV7MKVqS+eZPh73YU8LY/
         OqjiXv43xJkBccU1ieADe1XZ4yhhrXJVcJi8+r4MJXfuXrSw/G8FUYIZ5cmguT4YSibk
         z1HcsRAI5GL+ncQhOm/9oj7PZnivqAnLuarJBtGo7+zkboiiA11kqH44OSI11ZAk1B/Z
         SwwaZ0Qw+0ph2y4UG1EI2qzwZUfc6C9MxMS4IqGCNrQKNBIDejl+qpmyvCQtntisAbcz
         hJJQ==
X-Gm-Message-State: AOAM533v88yItE6LfjfGRLiH/vzwKB8nKyMoNQFWJFz7XL+p8vDn65Nt
	Ecb/l3+pNfgd5d6nhEJxyQg=
X-Google-Smtp-Source: ABdhPJxF0q05tIm8Fb0wpfOaFVP7ozVWkC5rpwygAb/fz7kSeMLUKlSpr2gq5g6m7IzhV+ueKjXowg==
X-Received: by 2002:aca:5742:: with SMTP id l63mr14139182oib.166.1606747253245;
        Mon, 30 Nov 2020 06:40:53 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id z10sm10119011oom.3.2020.11.30.06.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 06:40:52 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][RFC] weston-init: Stop running weston as root
To: Peter Bergin <peter@berginkonsult.se>,
 openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, alistair@alistair23.me
References: <20201119225853.12645-1-JPEWhacker@gmail.com>
 <4f9db259-0e99-0060-9b7c-a07c5f052bee@berginkonsult.se>
Message-ID: <220dcbbc-f77d-25ee-fe67-0c38c359b2df@gmail.com>
Date: Mon, 30 Nov 2020 08:40:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f9db259-0e99-0060-9b7c-a07c5f052bee@berginkonsult.se>
Content-Type: multipart/alternative;
 boundary="------------750E4760CCFFECB06FD0E892"
Content-Language: en-US

--------------750E4760CCFFECB06FD0E892
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/27/20 4:17 AM, Peter Bergin wrote:
>
> Hi,
>
> this is a good improvement to the security, thanks for sharing this!
>
> As the global socket now is at /run/wayland-0 users that belongs to 
> group 'wayland' and want to use weston needs to set its 
> XDG_RUNTIME_DIR accordingly. As probably more applications than weston 
> client is using XDG_RUNTIME_DIR it is probably a bad idea to 
> permanently set XDG_RUNTIME_DIR=/run? (Instead of standard 
> /run/user/<uid>) In my setup I created a file 
> /etc/profile.d/wayland.sh that make a symlink to /run/wayland-0 if the 
> user have write permission on it.
>
>      $ cat /etc/profile.d/wayland.sh
>      # A global socket is set up that can be used for users belonging to the wayland
>      # group to connect to weston server. Set up a soft link to that global socket.
>      WAYLAND_SOCKET=/run/wayland-0
>      [ -S $WAYLAND_SOCKET -a -w $WAYLAND_SOCKET ] && ln -s $WAYLAND_SOCKET $XDG_RUNTIME_DIR

Ya. I think maybe the problem is that will only work for an interactive 
shell, and wouldn't work for a service?

Also, you should avoid using the WAYLAND_SOCKET environment variable, as 
wayland clients will interpret that variable as a file descriptor number 
where a pre-connected wayland client socket is present when they start 
up (e.g. when weston launches a client with a pre-connected socket). I 
suspect the only reason this isn't causing you problems right now is 
because you aren't exporting it :)

If you want to make something compatible with what I've done here, you 
could probably get the same effect with:

  if [ -s /run/wayland-0 -a -w /run/wayland-0 ]; then

     export WAYLAND_DISPLAY=/run/wayland-0

  fi


>
> This will make the process a bit more automatic just creating a user 
> and add it to the group wayland. Is this a suitable solution? Is this 
> something that we would like upstream in the weston-init package?
>
Maybe. I tried really hard to make it so that you make 
$XDG_RUNTIME_DIR/wayland-0 be populated from /run/wayland-0, but I was 
unable to make it work (at least with systemd). The problem I found was 
that the systemd units for dealing with XDG_RUNTIME_DIR only deal with 
users by their UID, but we only know the user name at compile time 
(since OE doesn't use fixed UIDs). As such I was unable to get systemd 
to put things in the correct (UID based) XDG_RUNTIME_DIR.


>
> (Another side note not directly related to openembedded-core but more 
> to HW specific setups (meta-freescale in my case) that I would like to 
> share is that GPU device nodes also need correct permission for the 
> weston user otherwise startup of weston application does not work (if 
> weston using the GPU). In my case on i.Mx8 target I had to change 
> /dev/galcore device node to video group (already prepared in 
> udev-imx-rules package). I hope I can save time for someone else 
> seeing this error message on a i.Mx system:
>
> 	$ systemctl status weston
> 	* weston.service - Weston, a Wayland compositor, as a system service
> 	     Loaded: loaded (8;;file://imx8mnevk/lib/systemd/system/weston.service/lib/systemd/system/weston.service8;;; enabled; vendor preset: enabled)
> 	     Active: failed (Result: exit-code) since Fri 2020-11-27 10:11:52 UTC; 13s ago
> 	TriggeredBy: * weston.socket
> 	       Docs: 8;;man:weston(1)man:weston(1)8;;
> 	             8;;man:weston.ini(5)man:weston.ini(5)8;;
> 	             8;;http://wayland.freedesktop.org/http://wayland.freedesktop.org/8;;
> 	    Process: 276 ExecStart=/usr/bin/weston --modules=systemd-notify.so --log=/home/weston/weston.log (code=exited, status=1/FAILURE)
> 	   Main PID: 276 (code=exited, status=1/FAILURE)
>
> 	Nov 27 10:11:43 imx8mnevk systemd[1]: Starting Weston, a Wayland compositor, as a system service...
> 	Nov 27 10:11:44 imx8mnevk systemd[276]: pam_unix(weston-autologin:session): session opened for user weston by (uid=0)
> 	Nov 27 10:11:52 imx8mnevk systemd[1]: weston.service: Main process exited, code=exited, status=1/FAILURE
> 	Nov 27 10:11:52 imx8mnevk systemd[1]: weston.service: Failed with result 'exit-code'.
> 	Nov 27 10:11:52 imx8mnevk systemd[1]: Failed to start Weston, a Wayland compositor, as a system service.
>
> )
>

That's pretty common. You could send a patch to the BSP layer to correct 
the permissions.


> Best regards,
> /Peter
>
>
> On 2020-11-19 23:58, Joshua Watt wrote:
>> Running the weston compositor as the root user is an insecure default
>> behavior for OE-core. We can do much better, at least when using
>> systemd. Change the recipe to create a dedicated "weston" user and start
>> weston as this user. The systemd service and socket units are no longer
>> template units, as there were several inconsistencies in the templates.
>> Instead, there is now a global /run/wayland-0 socket that gets created,
>> and systemd will start weston on demand when a client connects to that
>> socket or when attempting to reach graphical.target, whichever comes
>> first. This also allows downstream users to easily change the behavior
>> so that weston *only* starts on demand by adding a drop file. Access to
>> the global socket is controlled by a "wayland" group; any user that is a
>> member of the group can use the socket to talk to the compositor. This
>> also satisfies another use case where another systemd service might
>> start a graphical application that needs to display with weston (e.g. a
>> single function device in kiosk mode). Finally, the udev rules for
>> starting weston with the existance of a DRM device have been removed.
>> Being WantedBy= a graphical target should eliminate the need for this
>> behavior, and having it present makes it difficult for downstream users
>> to start weston on demand (having to override the udev rules).
>>
>> Signed-off-by: Joshua Watt<JPEWhacker@gmail.com>
>> ---
>>   meta/recipes-graphics/wayland/weston-init.bb  | 33 ++++++++++++-------
>>   .../wayland/weston-init/71-weston-drm.rules   |  2 --
>>   .../{weston@.service  => weston.service}       | 14 +++++---
>>   .../wayland/weston-init/weston.socket         | 14 ++++++++
>>   .../wayland/weston-init/weston@.socket        | 10 ------
>>   5 files changed, 45 insertions(+), 28 deletions(-)
>>   delete mode 100644 meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
>>   rename meta/recipes-graphics/wayland/weston-init/{weston@.service  => weston.service} (83%)
>>   create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket
>>   delete mode 100644meta/recipes-graphics/wayland/weston-init/weston@.socket
>>
>> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
>> index a616c473ec..65d7b81dc5 100644
>> --- a/meta/recipes-graphics/wayland/weston-init.bb
>> +++ b/meta/recipes-graphics/wayland/weston-init.bb
>> @@ -7,9 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   SRC_URI ="file://init \ file://weston.env \ file://weston.ini \ - 
>> file://weston@.service \ - file://weston@.socket \ - 
>> file://71-weston-drm.rules \ + file://weston.service \ + 
>> file://weston.socket \ file://weston-autologin \ file://weston-start"
>>   
>> @@ -36,17 +35,15 @@ do_install() {
>>   	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
>>   
>>   	# Install Weston systemd service and accompanying udev rule
>> -	install -D -p -m0644 ${WORKDIR}/weston@.service  ${D}${systemd_system_unitdir}/weston@.service
>> -	install -D -p -m0644 ${WORKDIR}/weston@.socket  ${D}${systemd_system_unitdir}/weston@.socket
>> +	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
>> +	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
>>           if ["${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"  ]; then
>>   		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
>>           fi
>>   	sed -i -e s:/etc:${sysconfdir}:g \
>>   		-e s:/usr/bin:${bindir}:g \
>>   		-e s:/var:${localstatedir}:g \
>> -		${D}${systemd_unitdir}/system/weston@.service
>> -	install -D -p -m0644 ${WORKDIR}/71-weston-drm.rules \
>> -		${D}${sysconfdir}/udev/rules.d/71-weston-drm.rules
>> +		${D}${systemd_unitdir}/system/weston.service
>>   	# Install weston-start script
>>   	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
>>   	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
>> @@ -58,11 +55,15 @@ do_install() {
>>   	if ["${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 
>> 'no', d)}"  = "yes" ]; then
>>   		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
>>   	fi
>> +
>> +	install -dm 755 -o weston -g weston ${D}/home/weston
>>   }
>>   
>>   INHIBIT_UPDATERCD_BBCLASS ="${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 
>> '1', '', d)}"
>>   
>> -inherit update-rc.d features_check systemd
>> +inherit update-rc.d features_check systemd useradd
>> +
>> +USERADD_PACKAGES = "${PN}"
>>   
>>   # rdepends on weston which depends on virtual/egl
>>   # requires pam enabled if started via systemd
>> @@ -73,10 +74,18 @@ RDEPENDS_${PN} = "weston kbd"
>>   INITSCRIPT_NAME = "weston"
>>   INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
>>   
>> -FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service  ${systemd_system_unitdir}/weston@.socket  ${sysconfdir}/default/weston ${sysconfdir}/pam.d/"
>> +FILES_${PN} += "\
>> +    ${sysconfdir}/xdg/weston/weston.ini \
>> +    ${systemd_system_unitdir}/weston.service \
>> +    ${systemd_system_unitdir}/weston.socket \
>> +    ${sysconfdir}/default/weston \
>> +    ${sysconfdir}/pam.d/ \
>> +    /home/weston \
>> +    "
>>   
>>   CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
>>   
>> -SYSTEMD_SERVICE_${PN} ="weston@%i.service"
>> -SYSTEMD_AUTO_ENABLE = "disable"
>> +SYSTEMD_SERVICE_${PN} = "weston.service weston.socket"
>> +USERADD_PARAM_${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
>> +GROUPADD_PARAM_${PN} = "-r wayland"
>>   
>> diff --git a/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules b/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
>> deleted file mode 100644
>> index 1a1b8bbda4..0000000000
>> --- a/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
>> +++ /dev/null
>> @@ -1,2 +0,0 @@
>> -ACTION=="add", SUBSYSTEM=="graphics", KERNEL=="fb0", TAG+="systemd", ENV{SYSTEMD_WANTS}+="weston@root.service"
>> -ACTION=="add", SUBSYSTEM=="drm", KERNEL=="card0", TAG+="systemd", ENV{SYSTEMD_WANTS}+="weston@root.service"
>> diff --gita/meta/recipes-graphics/wayland/weston-init/weston@.service  b/meta/recipes-graphics/wayland/weston-init/weston.service
>> similarity index 83%
>> rename frommeta/recipes-graphics/wayland/weston-init/weston@.service
>> rename to meta/recipes-graphics/wayland/weston-init/weston.service
>> index ce8f4fb71a..e09625b31c 100644
>> ---a/meta/recipes-graphics/wayland/weston-init/weston@.service
>> +++ b/meta/recipes-graphics/wayland/weston-init/weston.service
>> @@ -9,6 +9,7 @@ Documentation=man:weston(1)  man:weston.ini(5)
>>   Documentation=http://wayland.freedesktop.org/
>>   
>>   # Make sure we are started after logins are permitted.
>> +Requires=systemd-user-sessions.service
>>   After=systemd-user-sessions.service
>>   
>>   # If Plymouth is used, we want to start when it is on its way out.
>> @@ -18,6 +19,9 @@ After=plymouth-quit-wait.service
>>   Wants=dbus.socket
>>   After=dbus.socket
>>   
>> +# Ensure the socket is present
>> +Requires=weston.socket
>> +
>>   # Since we are part of the graphical session, make sure we are started before
>>   # it is complete.
>>   Before=graphical.target
>> @@ -37,10 +41,11 @@ TimeoutStartSec=60
>>   WatchdogSec=20
>>   
>>   # The user to run Weston as.
>> -User=%I
>> +User=weston
>> +Group=weston
>>   
>> -# Make sure working directory is users home directory
>> -WorkingDirectory=/home/%i
>> +# Make sure the working directory is the users home directory
>> +WorkingDirectory=/home/weston
>>   
>>   # Set up a full user session for the user, required by Weston.
>>   PAMName=weston-autologin
>> @@ -61,5 +66,6 @@ UtmpIdentifier=tty7
>>   UtmpMode=user
>>   
>>   [Install]
>> +# Note: If you only want weston to start on-demand, remove this line with a
>> +# service drop file
>>   WantedBy=graphical.target
>> -DefaultInstance=tty7
>> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/meta/recipes-graphics/wayland/weston-init/weston.socket
>> new file mode 100644
>> index 0000000000..c1bdc83c05
>> --- /dev/null
>> +++ b/meta/recipes-graphics/wayland/weston-init/weston.socket
>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=Weston socket
>> +RequiresMountsFor=/run
>> +
>> +[Socket]
>> +ListenStream=/run/wayland-0
>> +SocketMode=0775
>> +SocketUser=weston
>> +SocketGroup=wayland
>> +RemoveOnStop=yes
>> +
>> +[Install]
>> +WantedBy=sockets.target
>> +
>> diff --gita/meta/recipes-graphics/wayland/weston-init/weston@.socket  b/meta/recipes-graphics/wayland/weston-init/weston@.socket
>> deleted file mode 100644
>> index f1790d74a8..0000000000
>> ---a/meta/recipes-graphics/wayland/weston-init/weston@.socket
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -[Unit]
>> -Description=Weston Wayland socket
>> -After=user-runtime-dir@1000.service
>> -
>> -[Socket]
>> -ListenStream=/run/user/1000/wayland-%I
>> -
>> -[Install]
>> -WantedBy=sockets.target
>> -
>>
>> 
>>

--------------750E4760CCFFECB06FD0E892
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/27/20 4:17 AM, Peter Bergin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4f9db259-0e99-0060-9b7c-a07c5f052bee@berginkonsult.se">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi,</p>
      <p>this is a good improvement to the security, thanks for sharing
        this!</p>
      <p>As the global socket now is at /run/wayland-0 users that
        belongs to group 'wayland' and want to use weston needs to set
        its XDG_RUNTIME_DIR accordingly. As probably more applications
        than weston client is using XDG_RUNTIME_DIR it is probably a bad
        idea to permanently set XDG_RUNTIME_DIR=/run? (Instead of
        standard /run/user/&lt;uid&gt;) In my setup I created a file
        /etc/profile.d/wayland.sh that make a symlink to /run/wayland-0
        if the user have write permission on it. <br>
      </p>
      <pre>    $ cat /etc/profile.d/wayland.sh 
    # A global socket is set up that can be used for users belonging to the wayland
    # group to connect to weston server. Set up a soft link to that global socket.
    WAYLAND_SOCKET=/run/wayland-0
    [ -S $WAYLAND_SOCKET -a -w $WAYLAND_SOCKET ] &amp;&amp; ln -s $WAYLAND_SOCKET $XDG_RUNTIME_DIR</pre>
    </blockquote>
    <p>Ya. I think maybe the problem is that will only work for an
      interactive shell, and wouldn't work for a service?</p>
    <p>Also, you should avoid using the WAYLAND_SOCKET environment
      variable, as wayland clients will interpret that variable as a
      file descriptor number where a pre-connected wayland client socket
      is present when they start up (e.g. when weston launches a client
      with a pre-connected socket). I suspect the only reason this isn't
      causing you problems right now is because you aren't exporting it
      :)</p>
    <p>If you want to make something compatible with what I've done
      here, you could probably get the same effect with:</p>
    <p> if [ -s /run/wayland-0 -a -w /run/wayland-0 ]; then</p>
    <p>    export WAYLAND_DISPLAY=/run/wayland-0</p>
    <p> fi<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:4f9db259-0e99-0060-9b7c-a07c5f052bee@berginkonsult.se">
      <p><br>
        This will make the process a bit more automatic just creating a
        user and add it to the group wayland. Is this a suitable
        solution? Is this something that we would like upstream in the
        weston-init package?</p>
    </blockquote>
    <p>Maybe. I tried really hard to make it so that you make
      $XDG_RUNTIME_DIR/wayland-0 be populated from /run/wayland-0, but I
      was unable to make it work (at least with systemd). The problem I
      found was that the systemd units for dealing with XDG_RUNTIME_DIR
      only deal with users by their UID, but we only know the user name
      at compile time (since OE doesn't use fixed UIDs). As such I was
      unable to get systemd to put things in the correct (UID based)
      XDG_RUNTIME_DIR.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:4f9db259-0e99-0060-9b7c-a07c5f052bee@berginkonsult.se">
      <p><br>
      </p>
      <p>(Another side note not directly related to openembedded-core
        but more to HW specific setups (meta-freescale in my case) that
        I would like to share is that GPU device nodes also need correct
        permission for the weston user otherwise startup of weston
        application does not work (if weston using the GPU). In my case
        on i.Mx8 target I had to change /dev/galcore device node to
        video group (already prepared in udev-imx-rules package). I hope
        I can save time for someone else seeing this error message on a
        i.Mx system:</p>
      <pre>	$ systemctl status weston
	* weston.service - Weston, a Wayland compositor, as a system service
	     Loaded: loaded (8;;<a class="moz-txt-link-freetext" href="file://imx8mnevk/lib/systemd/system/weston.service/lib/systemd/system/weston.service8" moz-do-not-send="true">file://imx8mnevk/lib/systemd/system/weston.service/lib/systemd/system/weston.service8</a>;;; enabled; vendor preset: enabled)
	     Active: failed (Result: exit-code) since Fri 2020-11-27 10:11:52 UTC; 13s ago
	TriggeredBy: * weston.socket
	       Docs: 8;;<a class="moz-txt-link-freetext" href="man:weston(1)man:weston(1)8" moz-do-not-send="true">man:weston(1)man:weston(1)8</a>;;
	             8;;<a class="moz-txt-link-freetext" href="man:weston.ini(5)man:weston.ini(5)8" moz-do-not-send="true">man:weston.ini(5)man:weston.ini(5)8</a>;;
	             8;;<a class="moz-txt-link-freetext" href="http://wayland.freedesktop.org/http://wayland.freedesktop.org/8" moz-do-not-send="true">http://wayland.freedesktop.org/http://wayland.freedesktop.org/8</a>;;
	    Process: 276 ExecStart=/usr/bin/weston --modules=systemd-notify.so --log=/home/weston/weston.log (code=exited, status=1/FAILURE)
	   Main PID: 276 (code=exited, status=1/FAILURE)

	Nov 27 10:11:43 imx8mnevk systemd[1]: Starting Weston, a Wayland compositor, as a system service...
	Nov 27 10:11:44 imx8mnevk systemd[276]: pam_unix(weston-autologin:session): session opened for user weston by (uid=0)
	Nov 27 10:11:52 imx8mnevk systemd[1]: weston.service: Main process exited, code=exited, status=1/FAILURE
	Nov 27 10:11:52 imx8mnevk systemd[1]: weston.service: Failed with result 'exit-code'.
	Nov 27 10:11:52 imx8mnevk systemd[1]: Failed to start Weston, a Wayland compositor, as a system service.

</pre>
      <p>)</p>
    </blockquote>
    <p><br>
    </p>
    <p>That's pretty common. You could send a patch to the BSP layer to
      correct the permissions.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:4f9db259-0e99-0060-9b7c-a07c5f052bee@berginkonsult.se">
      <p>Best regards,<br>
        /Peter<br>
      </p>
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2020-11-19 23:58, Joshua Watt
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20201119225853.12645-1-JPEWhacker@gmail.com">
        <pre class="moz-quote-pre" wrap="">Running the weston compositor as the root user is an insecure default
behavior for OE-core. We can do much better, at least when using
systemd. Change the recipe to create a dedicated "weston" user and start
weston as this user. The systemd service and socket units are no longer
template units, as there were several inconsistencies in the templates.
Instead, there is now a global /run/wayland-0 socket that gets created,
and systemd will start weston on demand when a client connects to that
socket or when attempting to reach graphical.target, whichever comes
first. This also allows downstream users to easily change the behavior
so that weston *only* starts on demand by adding a drop file. Access to
the global socket is controlled by a "wayland" group; any user that is a
member of the group can use the socket to talk to the compositor. This
also satisfies another use case where another systemd service might
start a graphical application that needs to display with weston (e.g. a
single function device in kiosk mode). Finally, the udev rules for
starting weston with the existance of a DRM device have been removed.
Being WantedBy= a graphical target should eliminate the need for this
behavior, and having it present makes it difficult for downstream users
to start weston on demand (having to override the udev rules).

Signed-off-by: Joshua Watt <a class="moz-txt-link-rfc2396E" href="mailto:JPEWhacker@gmail.com" moz-do-not-send="true">&lt;JPEWhacker@gmail.com&gt;</a>
---
 meta/recipes-graphics/wayland/weston-init.bb  | 33 ++++++++++++-------
 .../wayland/weston-init/71-weston-drm.rules   |  2 --
 .../{<a class="moz-txt-link-abbreviated" href="mailto:weston@.service" moz-do-not-send="true">weston@.service</a> =&gt; weston.service}       | 14 +++++---
 .../wayland/weston-init/weston.socket         | 14 ++++++++
 .../wayland/weston-init/weston@.socket        | 10 ------
 5 files changed, 45 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
 rename meta/recipes-graphics/wayland/weston-init/{<a class="moz-txt-link-abbreviated" href="mailto:weston@.service" moz-do-not-send="true">weston@.service</a> =&gt; weston.service} (83%)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket
 delete mode 100644 <a class="moz-txt-link-abbreviated" href="mailto:meta/recipes-graphics/wayland/weston-init/weston@.socket" moz-do-not-send="true">meta/recipes-graphics/wayland/weston-init/weston@.socket</a>

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index a616c473ec..65d7b81dc5 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -7,9 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="file://init\file://weston.env\file://weston.ini\-file://weston@.service\-file://weston@.socket\-file://71-weston-drm.rules\+file://weston.service\+file://weston.socket\file://weston-autologin\file://weston-start" moz-do-not-send="true">"file://init \
            file://weston.env \
            file://weston.ini \
-           file://weston@.service \
-           file://weston@.socket \
-           file://71-weston-drm.rules \
+           file://weston.service \
+           file://weston.socket \
            file://weston-autologin \
            file://weston-start"</a>
 
@@ -36,17 +35,15 @@ do_install() {
 	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
 	# Install Weston systemd service and accompanying udev rule
-	install -D -p -m0644 ${<a class="moz-txt-link-abbreviated" href="mailto:WORKDIR}/weston@.service" moz-do-not-send="true">WORKDIR}/weston@.service</a> ${D}${<a class="moz-txt-link-abbreviated" href="mailto:systemd_system_unitdir}/weston@.service" moz-do-not-send="true">systemd_system_unitdir}/weston@.service</a>
-	install -D -p -m0644 ${<a class="moz-txt-link-abbreviated" href="mailto:WORKDIR}/weston@.socket" moz-do-not-send="true">WORKDIR}/weston@.socket</a> ${D}${<a class="moz-txt-link-abbreviated" href="mailto:systemd_system_unitdir}/weston@.socket" moz-do-not-send="true">systemd_system_unitdir}/weston@.socket</a>
+	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
         if [ <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.filter('DISTRO_FEATURES','pam',d)}" moz-do-not-send="true">"${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"</a> ]; then
 		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
         fi
 	sed -i -e s:/etc:${sysconfdir}:g \
 		-e s:/usr/bin:${bindir}:g \
 		-e s:/var:${localstatedir}:g \
-		${D}${<a class="moz-txt-link-abbreviated" href="mailto:systemd_unitdir}/system/weston@.service" moz-do-not-send="true">systemd_unitdir}/system/weston@.service</a>
-	install -D -p -m0644 ${WORKDIR}/71-weston-drm.rules \
-		${D}${sysconfdir}/udev/rules.d/71-weston-drm.rules
+		${D}${systemd_unitdir}/system/weston.service
 	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
@@ -58,11 +55,15 @@ do_install() {
 	if [ <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','no-idle-timeout','yes','no',d)}" moz-do-not-send="true">"${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}"</a> = "yes" ]; then
 		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
+
+	install -dm 755 -o weston -g weston ${D}/home/weston
 }
 
 INHIBIT_UPDATERCD_BBCLASS = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager','systemd','1','',d)}" moz-do-not-send="true">"${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"</a>
 
-inherit update-rc.d features_check systemd
+inherit update-rc.d features_check systemd useradd
+
+USERADD_PACKAGES = "${PN}"
 
 # rdepends on weston which depends on virtual/egl
 # requires pam enabled if started via systemd
@@ -73,10 +74,18 @@ RDEPENDS_${PN} = "weston kbd"
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
-FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${<a class="moz-txt-link-abbreviated" href="mailto:systemd_system_unitdir}/weston@.service" moz-do-not-send="true">systemd_system_unitdir}/weston@.service</a> ${<a class="moz-txt-link-abbreviated" href="mailto:systemd_system_unitdir}/weston@.socket" moz-do-not-send="true">systemd_system_unitdir}/weston@.socket</a> ${sysconfdir}/default/weston ${sysconfdir}/pam.d/"
+FILES_${PN} += "\
+    ${sysconfdir}/xdg/weston/weston.ini \
+    ${systemd_system_unitdir}/weston.service \
+    ${systemd_system_unitdir}/weston.socket \
+    ${sysconfdir}/default/weston \
+    ${sysconfdir}/pam.d/ \
+    /home/weston \
+    "
 
 CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
-SYSTEMD_SERVICE_${PN} = <a class="moz-txt-link-rfc2396E" href="mailto:weston@%i.service" moz-do-not-send="true">"weston@%i.service"</a>
-SYSTEMD_AUTO_ENABLE = "disable"
+SYSTEMD_SERVICE_${PN} = "weston.service weston.socket"
+USERADD_PARAM_${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
+GROUPADD_PARAM_${PN} = "-r wayland"
 
diff --git a/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules b/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
deleted file mode 100644
index 1a1b8bbda4..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
+++ /dev/null
@@ -1,2 +0,0 @@
-ACTION=="add", SUBSYSTEM=="graphics", KERNEL=="fb0", TAG+="systemd", ENV{SYSTEMD_WANTS}+=<a class="moz-txt-link-rfc2396E" href="mailto:weston@root.service" moz-do-not-send="true">"weston@root.service"</a>
-ACTION=="add", SUBSYSTEM=="drm", KERNEL=="card0", TAG+="systemd", ENV{SYSTEMD_WANTS}+=<a class="moz-txt-link-rfc2396E" href="mailto:weston@root.service" moz-do-not-send="true">"weston@root.service"</a>
diff --git <a class="moz-txt-link-abbreviated" href="mailto:a/meta/recipes-graphics/wayland/weston-init/weston@.service" moz-do-not-send="true">a/meta/recipes-graphics/wayland/weston-init/weston@.service</a> b/meta/recipes-graphics/wayland/weston-init/weston.service
similarity index 83%
rename from <a class="moz-txt-link-abbreviated" href="mailto:meta/recipes-graphics/wayland/weston-init/weston@.service" moz-do-not-send="true">meta/recipes-graphics/wayland/weston-init/weston@.service</a>
rename to meta/recipes-graphics/wayland/weston-init/weston.service
index ce8f4fb71a..e09625b31c 100644
--- <a class="moz-txt-link-abbreviated" href="mailto:a/meta/recipes-graphics/wayland/weston-init/weston@.service" moz-do-not-send="true">a/meta/recipes-graphics/wayland/weston-init/weston@.service</a>
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -9,6 +9,7 @@ Documentation=<a class="moz-txt-link-freetext" href="man:weston(1)" moz-do-not-send="true">man:weston(1)</a> <a class="moz-txt-link-freetext" href="man:weston.ini(5)" moz-do-not-send="true">man:weston.ini(5)</a>
 Documentation=<a class="moz-txt-link-freetext" href="http://wayland.freedesktop.org/" moz-do-not-send="true">http://wayland.freedesktop.org/</a>
 
 # Make sure we are started after logins are permitted.
+Requires=systemd-user-sessions.service
 After=systemd-user-sessions.service
 
 # If Plymouth is used, we want to start when it is on its way out.
@@ -18,6 +19,9 @@ After=plymouth-quit-wait.service
 Wants=dbus.socket
 After=dbus.socket
 
+# Ensure the socket is present
+Requires=weston.socket
+
 # Since we are part of the graphical session, make sure we are started before
 # it is complete.
 Before=graphical.target
@@ -37,10 +41,11 @@ TimeoutStartSec=60
 WatchdogSec=20
 
 # The user to run Weston as.
-User=%I
+User=weston
+Group=weston
 
-# Make sure working directory is users home directory
-WorkingDirectory=/home/%i
+# Make sure the working directory is the users home directory
+WorkingDirectory=/home/weston
 
 # Set up a full user session for the user, required by Weston.
 PAMName=weston-autologin
@@ -61,5 +66,6 @@ UtmpIdentifier=tty7
 UtmpMode=user
 
 [Install]
+# Note: If you only want weston to start on-demand, remove this line with a
+# service drop file
 WantedBy=graphical.target
-DefaultInstance=tty7
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/meta/recipes-graphics/wayland/weston-init/weston.socket
new file mode 100644
index 0000000000..c1bdc83c05
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston.socket
@@ -0,0 +1,14 @@
+[Unit]
+Description=Weston socket
+RequiresMountsFor=/run
+
+[Socket]
+ListenStream=/run/wayland-0
+SocketMode=0775
+SocketUser=weston
+SocketGroup=wayland
+RemoveOnStop=yes
+
+[Install]
+WantedBy=sockets.target
+
diff --git <a class="moz-txt-link-abbreviated" href="mailto:a/meta/recipes-graphics/wayland/weston-init/weston@.socket" moz-do-not-send="true">a/meta/recipes-graphics/wayland/weston-init/weston@.socket</a> <a class="moz-txt-link-abbreviated" href="mailto:b/meta/recipes-graphics/wayland/weston-init/weston@.socket" moz-do-not-send="true">b/meta/recipes-graphics/wayland/weston-init/weston@.socket</a>
deleted file mode 100644
index f1790d74a8..0000000000
--- <a class="moz-txt-link-abbreviated" href="mailto:a/meta/recipes-graphics/wayland/weston-init/weston@.socket" moz-do-not-send="true">a/meta/recipes-graphics/wayland/weston-init/weston@.socket</a>
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Weston Wayland socket
-After=user-runtime-dir@1000.service
-
-[Socket]
-ListenStream=/run/user/1000/wayland-%I
-
-[Install]
-WantedBy=sockets.target
-
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------750E4760CCFFECB06FD0E892--

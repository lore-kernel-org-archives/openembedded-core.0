Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiBNf-0004Rw-Us
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 22:59:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2012 13:44:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="231891795"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2012 13:44:45 -0800
Message-ID: <50C657CD.2040103@linux.intel.com>
Date: Mon, 10 Dec 2012 13:44:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1354531187.git.Qi.Chen@windriver.com>
	<4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
	<50C6126F.3020401@linux.intel.com>
In-Reply-To: <50C6126F.3020401@linux.intel.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] ICU: add pkgconfig support
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
X-List-Received-Date: Mon, 10 Dec 2012 21:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2012 08:48 AM, Saul Wold wrote:
> On 12/04/2012 12:46 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add pkgconfig support to ICU.
>>
>> [YOCTO #2453]
>>
> This patch seems to have introduced a problem with webkit-gtk
>
>> | mv -f
>> Source/WebKit/gtk/WebCoreSupport/.deps/libwebkitgtk_1_0_la-AcceleratedCompositingContextClutter.Tpo
>> Source/WebKit/gtk/WebCoreSupport/.deps/libwebkitgtk_1_0_la-AcceleratedCompositingContextClutter.Plo
>>
>> | ./i586-poky-linux-libtool  --tag=CXX   --mode=compile
>> i586-poky-linux-g++  -m32   -march=i586
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86
>> -DHAVE_CONFIG_H -I.  -DBUILDING_WEBKIT -Wall -W -Wcast-align
>> -Wchar-subscripts -Wreturn-type -Wformat -Wformat-security
>> -Wno-format-y2k -Wundef -Wmissing-format-attribute -Wpointer-arith
>> -Wwrite-strings -Wno-unused-parameter -Wno-parentheses -fno-exceptions
>> -DENABLE_GLIB_SUPPORT=1 -DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1
>> -DWTF_CHANGES -DXP_UNIX  -DWTF_USE_ICU_UNICODE=1
>> -DWTF_USE_GSTREAMER=1     -DGTK_API_VERSION_2=1 -DNDEBUG
>> -I./Source/ThirdParty/ANGLE/src -I./Source/ThirdParty/ANGLE/include
>> -I./Source/ThirdParty/ANGLE/include/GLSLANG -I./Source/WebCore
>> -I./Source/WebCore/accessibility -I./Source/WebCore/bindings
>> -I./Source/WebCore/bindings/generic -I./Source/WebCore/bindings/js
>> -I./Source/WebCore/bindings/js/specialization
>> -I./Source/WebCore/bridge -I./Source/WebCore/bridge/c -I.
> /Source/WebCore/bridge/jni/jsc -I./Source/WebCore/bridge/jsc
> -I./Source/WebCore/css -I./Source/WebCore/dom
> -I./Source/WebCore/dom/default -I./Source/WebCore/editing
> -I./Source/WebCore/fileapi -I./Source/WebCore/history
> -I./Source/WebCore/html -I./Source/WebCore/html/canvas
> -I./Source/WebCore/html/parser -I./Source/WebCore/html/shadow
> -I./Source/WebCore/html/track -I./Source/WebCore/inspector
> -I./Source/WebCore/loader -I./Source/WebCore/loader/appcache
> -I./Source/WebCore/loader/archive -I./Source/WebCore/loader/cache
> -I./Source/WebCore/loader/icon -I./Source/WebCore/mathml
> -I./Source/WebCore/mediastream -I./Source/WebCore/notifications
> -I./Source/WebCore/page -I./Source/WebCore/page/animation
> -I./Source/WebCore/page/scrolling -I./Source/WebCore/platform
> -I./Source/WebCore/platform/animation -I./Source/WebCore/platform/audio
> -I./Source/WebCore/platform/graphics
> -I./Source/WebCore/platform/graphics/filters
> -I./Source/WebCore/platform/graphics/filters/arm
> -I./Source/WebCore/platform/graph
> ics/gpu -I./Source/WebCore/platform/graphics/opengl
> -I./Source/WebCore/platform/graphics/opentype
> -I./Source/WebCore/platform/graphics/transforms
> -I./Source/WebCore/platform/image-decoders
> -I./Source/WebCore/platform/image-decoders/bmp
> -I./Source/WebCore/platform/image-decoders/gif
> -I./Source/WebCore/platform/image-decoders/ico
> -I./Source/WebCore/platform/image-decoders/jpeg
> -I./Source/WebCore/platform/image-decoders/webp
> -I./Source/WebCore/platform/image-decoders/png
> -I./Source/WebCore/platform/leveldb
> -I./Source/WebCore/platform/mediastream -I./Source/WebCore/platform/mock
> -I./Source/WebCore/platform/network -I./Source/WebCore/platform/sql
> -I./Source/WebCore/platform/text
> -I./Source/WebCore/platform/text/transcoder
> -I./Source/WebCore/platform/win -I./Source/WebCore/plugins
> -I./Source/WebCore/plugins/win -I./Source/WebCore/rendering
> -I./Source/WebCore/rendering/mathml -I./Source/WebCore/rendering/style
> -I./Source/WebCore/rendering/svg -I./Source/WebCore/storage
> -I./Source/WebCore/svg
> -I./Source/WebCore/svg/animation -I./Source/WebCore/svg/graphics
> -I./Source/WebCore/svg/graphics/filters
> -I./Source/WebCore/svg/properties -I./Source/WebCore/testing
> -I./Source/WebCore/testing/js -I./Source/WebCore/webaudio
> -I./Source/WebCore/websockets -I./Source/WebCore/workers
> -I./Source/WebCore/xml -I./Source/WebCore/xml/parser
> -I./WebCore/bindings/js -I./DerivedSources/WebCore -I./DerivedSources
> -I./DerivedSources/JavaScriptCore -DDATA_DIR=\"/usr/share\"
> -DENABLE_CHANNEL_MESSAGING=1   -DENABLE_METER_TAG=1
> -DENABLE_PROGRESS_TAG=1 -DENABLE_JAVASCRIPT_DEBUGGER=1
> -DENABLE_GAMEPAD=0 -DENABLE_SQL_DATABASE=1  -DENABLE_DATALIST=1
> -DENABLE_DIRECTORY_UPLOAD=0     -DENABLE_TOUCH_ICON_LOADING=0
> -DENABLE_INPUT_COLOR=0  -DENABLE_INPUT_SPEECH=0
> -DENABLE_ICONDATABASE=1   -DENABLE_VIDEO=1   -DENABLE_MEDIA_SOURCE=0
> -DENABLE_MEDIA_STATISTICS=0 -DENABLE_FULLSCREEN_API=1
> -DENABLE_VIDEO_TRACK=0  -DENABLE_MEDIA_STREAM=0 -DENABLE_XSLT=1
> -DENABLE_WORKERS=1 -DENABLE_SHADOW_DOM=1 -DENABLE_SHARED_
> WORKERS=1 -DENABLE_FILTERS=1  -DENABLE_MATHML=1  -DENABLE_SVG=1
> -DENABLE_SVG_FONTS=1   -DENABLE_WEB_SOCKETS=1  -DENABLE_BLOB=1
> -DENABLE_REQUEST_ANIMATION_FRAME=1 -DENABLE_WEBGL=1
> -DWEBKITGTK_API_VERSION_STRING=\"1.0\" -DWTF_USE_SOUP=1
> -I./Source/WebCore/accessibility/gtk -I./Source/WebCore/loader/gtk
> -I./Source/WebCore/page/gtk -I./Source/WebCore/platform/cairo
> -I./Source/WebCore/platform/audio/gstreamer
> -I./Source/WebCore/platform/graphics/cairo
> -I./Source/WebCore/platform/graphics/glx
> -I./Source/WebCore/platform/graphics/gstreamer
> -I./Source/WebCore/platform/graphics/gtk -I./Source/WebCore/platform/gtk
> -I./Source/WebCore/platform/network/soup -DWTF_USE_FREETYPE=1
> -I./Source/WebCore/platform/graphics/freetype   -I./Source
> -I./Source/JavaScriptCore -I./Source/JavaScriptCore/API
> -I./Source/JavaScriptCore/assembler -I./Source/JavaScriptCore/bytecode
> -I./Source/JavaScriptCore/bytecompiler -I./Source/JavaScriptCore/dfg
> -I./Source/JavaScriptCore/heap -I./Source/JavaScriptCore/debug
> ger -I./Source/JavaScriptCore/ForwardingHeaders
> -I./Source/JavaScriptCore/interpreter -I./Source/JavaScriptCore/jit
> -I./Source/JavaScriptCore/jit -I./Source/JavaScriptCore/parser
> -I./Source/JavaScriptCore/profiler -I./Source/JavaScriptCore/runtime
> -I./Source/JavaScriptCore/tools -I./Source/JavaScriptCore/wtf
> -I./Source/JavaScriptCore/wtf -I./Source/JavaScriptCore/wtf/gobject
> -I./Source/JavaScriptCore/wtf/gtk -I./Source/JavaScriptCore/wtf/text
> -I./Source/JavaScriptCore/wtf/unicode -I./Source/JavaScriptCore/yarr
> -I./DerivedSources/JavaScriptCore -I./Source/WTF -fno-strict-aliasing
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/cairo
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/
> nightly-world/build/build/tmp/sysroots/qemux86/usr/include/pixman-1
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libpng12
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/enchant
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -pthread -I/srv/home/pokybuild/yocto-autobuilder/yocto-s
> lave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/gstreamer-0.10
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libsoup-2.4
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightl
> y-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/pango-1.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -D_REENTRANT     -fvisibility-inlines-hidden -fno-rtti -O2 -pipe -g
> -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden
> -Wno-c++0x-compat -O2 -MT
> Source/WebCore/bridge/libWebCore_la-runtime_root.lo -MD -MP -MF
> Source/WebCore/bridge/.deps/libWebCore_la-runtime_root.Tpo -c -o
> Source/WebCore/bridge/
> libWebCore_la-runtime_root.lo `test -f
> 'Source/WebCore/bridge/runtime_root.cpp' || echo
> './'`Source/WebCore/bridge/runtime_root.cpp
>> | i586-poky-linux-libtool: compile:  i586-poky-linux-g++ -m32
>> -march=i586
>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86
>> -DHAVE_CONFIG_H -I. -DBUILDING_WEBKIT -Wall -W -Wcast-align
>> -Wchar-subscripts -Wreturn-type -Wformat -Wformat-security
>> -Wno-format-y2k -Wundef -Wmissing-format-attribute -Wpointer-arith
>> -Wwrite-strings -Wno-unused-parameter -Wno-parentheses -fno-exceptions
>> -DENABLE_GLIB_SUPPORT=1 -DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1
>> -DWTF_CHANGES -DXP_UNIX -DWTF_USE_ICU_UNICODE=1 -DWTF_USE_GSTREAMER=1
>> -DGTK_API_VERSION_2=1 -DNDEBUG -I./Source/ThirdParty/ANGLE/src
>> -I./Source/ThirdParty/ANGLE/include
>> -I./Source/ThirdParty/ANGLE/include/GLSLANG -I./Source/WebCore
>> -I./Source/WebCore/accessibility -I./Source/WebCore/bindings
>> -I./Source/WebCore/bindings/generic -I./Source/WebCore/bindings/js
>> -I./Source/WebCore/bindings/js/specialization
>> -I./Source/WebCore/bridge -I./Source/WebCore/bridge/c
>> -I./Source/WebCore/bridge/jni/jsc -
> I./Source/WebCore/bridge/jsc -I./Source/WebCore/css
> -I./Source/WebCore/dom -I./Source/WebCore/dom/default
> -I./Source/WebCore/editing -I./Source/WebCore/fileapi
> -I./Source/WebCore/history -I./Source/WebCore/html
> -I./Source/WebCore/html/canvas -I./Source/WebCore/html/parser
> -I./Source/WebCore/html/shadow -I./Source/WebCore/html/track
> -I./Source/WebCore/inspector -I./Source/WebCore/loader
> -I./Source/WebCore/loader/appcache -I./Source/WebCore/loader/archive
> -I./Source/WebCore/loader/cache -I./Source/WebCore/loader/icon
> -I./Source/WebCore/mathml -I./Source/WebCore/mediastream
> -I./Source/WebCore/notifications -I./Source/WebCore/page
> -I./Source/WebCore/page/animation -I./Source/WebCore/page/scrolling
> -I./Source/WebCore/platform -I./Source/WebCore/platform/animation
> -I./Source/WebCore/platform/audio -I./Source/WebCore/platform/graphics
> -I./Source/WebCore/platform/graphics/filters
> -I./Source/WebCore/platform/graphics/filters/arm
> -I./Source/WebCore/platform/graphics/gpu -I./Source/WebCore/platf
> orm/graphics/opengl -I./Source/WebCore/platform/graphics/opentype
> -I./Source/WebCore/platform/graphics/transforms
> -I./Source/WebCore/platform/image-decoders
> -I./Source/WebCore/platform/image-decoders/bmp
> -I./Source/WebCore/platform/image-decoders/gif
> -I./Source/WebCore/platform/image-decoders/ico
> -I./Source/WebCore/platform/image-decoders/jpeg
> -I./Source/WebCore/platform/image-decoders/webp
> -I./Source/WebCore/platform/image-decoders/png
> -I./Source/WebCore/platform/leveldb
> -I./Source/WebCore/platform/mediastream -I./Source/WebCore/platform/mock
> -I./Source/WebCore/platform/network -I./Source/WebCore/platform/sql
> -I./Source/WebCore/platform/text
> -I./Source/WebCore/platform/text/transcoder
> -I./Source/WebCore/platform/win -I./Source/WebCore/plugins
> -I./Source/WebCore/plugins/win -I./Source/WebCore/rendering
> -I./Source/WebCore/rendering/mathml -I./Source/WebCore/rendering/style
> -I./Source/WebCore/rendering/svg -I./Source/WebCore/storage
> -I./Source/WebCore/svg -I./Source/WebCore/svg/animatio
> n -I./Source/WebCore/svg/graphics
> -I./Source/WebCore/svg/graphics/filters
> -I./Source/WebCore/svg/properties -I./Source/WebCore/testing
> -I./Source/WebCore/testing/js -I./Source/WebCore/webaudio
> -I./Source/WebCore/websockets -I./Source/WebCore/workers
> -I./Source/WebCore/xml -I./Source/WebCore/xml/parser
> -I./WebCore/bindings/js -I./DerivedSources/WebCore -I./DerivedSources
> -I./DerivedSources/JavaScriptCore -DDATA_DIR=\"/usr/share\"
> -DENABLE_CHANNEL_MESSAGING=1 -DENABLE_METER_TAG=1
> -DENABLE_PROGRESS_TAG=1 -DENABLE_JAVASCRIPT_DEBUGGER=1
> -DENABLE_GAMEPAD=0 -DENABLE_SQL_DATABASE=1 -DENABLE_DATALIST=1
> -DENABLE_DIRECTORY_UPLOAD=0 -DENABLE_TOUCH_ICON_LOADING=0
> -DENABLE_INPUT_COLOR=0 -DENABLE_INPUT_SPEECH=0 -DENABLE_ICONDATABASE=1
> -DENABLE_VIDEO=1 -DENABLE_MEDIA_SOURCE=0 -DENABLE_MEDIA_STATISTICS=0
> -DENABLE_FULLSCREEN_API=1 -DENABLE_VIDEO_TRACK=0 -DENABLE_MEDIA_STREAM=0
> -DENABLE_XSLT=1 -DENABLE_WORKERS=1 -DENABLE_SHADOW_DOM=1
> -DENABLE_SHARED_WORKERS=1 -DENABLE_FILTERS=1 -DENABLE_MATHML=1 -DENABL
> E_SVG=1 -DENABLE_SVG_FONTS=1 -DENABLE_WEB_SOCKETS=1 -DENABLE_BLOB=1
> -DENABLE_REQUEST_ANIMATION_FRAME=1 -DENABLE_WEBGL=1
> -DWEBKITGTK_API_VERSION_STRING=\"1.0\" -DWTF_USE_SOUP=1
> -I./Source/WebCore/accessibility/gtk -I./Source/WebCore/loader/gtk
> -I./Source/WebCore/page/gtk -I./Source/WebCore/platform/cairo
> -I./Source/WebCore/platform/audio/gstreamer
> -I./Source/WebCore/platform/graphics/cairo
> -I./Source/WebCore/platform/graphics/glx
> -I./Source/WebCore/platform/graphics/gstreamer
> -I./Source/WebCore/platform/graphics/gtk -I./Source/WebCore/platform/gtk
> -I./Source/WebCore/platform/network/soup -DWTF_USE_FREETYPE=1
> -I./Source/WebCore/platform/graphics/freetype -I./Source
> -I./Source/JavaScriptCore -I./Source/JavaScriptCore/API
> -I./Source/JavaScriptCore/assembler -I./Source/JavaScriptCore/bytecode
> -I./Source/JavaScriptCore/bytecompiler -I./Source/JavaScriptCore/dfg
> -I./Source/JavaScriptCore/heap -I./Source/JavaScriptCore/debugger
> -I./Source/JavaScriptCore/ForwardingHeaders -I./Source/JavaScript
> Core/interpreter -I./Source/JavaScriptCore/jit
> -I./Source/JavaScriptCore/jit -I./Source/JavaScriptCore/parser
> -I./Source/JavaScriptCore/profiler -I./Source/JavaScriptCore/runtime
> -I./Source/JavaScriptCore/tools -I./Source/JavaScriptCore/wtf
> -I./Source/JavaScriptCore/wtf -I./Source/JavaScriptCore/wtf/gobject
> -I./Source/JavaScriptCore/wtf/gtk -I./Source/JavaScriptCore/wtf/text
> -I./Source/JavaScriptCore/wtf/unicode -I./Source/JavaScriptCore/yarr
> -I./DerivedSources/JavaScriptCore -I./Source/WTF -fno-strict-aliasing
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/cairo
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/pixman-1
> -
> I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libpng12
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/enchant
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/gstreamer-0.10
>
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libsoup-2.4
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -I/srv/home/pokybuild
> /yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/libxml2
> -pthread
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/pango-1.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -D_REENTRANT -fvisibility-inlines-hidden -fno-rtti -O2 -pipe -g
> -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden
> -Wno-c++0x-compat -O2 -MT
> Source/WebCore/bridge/libWebCore_la-runtime_root.lo -MD -MP -MF
> Source/WebCore/bridge/.deps/libWebCore_la-runtime_root.Tpo -c
> Source/WebCore/bridge/runtime_root.cpp  -fPIC -DPIC -o
> Source/WebCore/bridge/.libs/libWebCore_la-runtime_root.o
>> | In file included from ./Source/WebCore/dom/EventTarget.h:35:0,
>> |                  from ./Source/WebCore/dom/Node.h:29,
>> |                  from ./Source/WebCore/editing/VisiblePosition.h:30,
>> |                  from
>> ./Source/WebCore/accessibility/AccessibilityObject.h:35,
>> |                  from
>> ./Source/WebCore/accessibility/AXObjectCache.h:29,
>> |                  from ./Source/WebCore/page/ChromeClient.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.cpp:26:
>> | ./Source/WebCore/dom/EventListenerMap.h:55:56: error:
>> 'EventListener_3_6' was not declared in this scope
>> | ./Source/WebCore/dom/EventListenerMap.h:55:69: error: template
>> argument 1 is invalid
>> | ./Source/WebCore/dom/EventListenerMap.h:56:48: error:
>> 'EventListener_3_6' has not been declared
>> | In file included from ./Source/WebCore/dom/EventTarget.h:35:0,
>> |                  from ./Source/WebCore/dom/Node.h:29,
>> |                  from ./Source/WebCore/editing/VisiblePosition.h:30,
>> |                  from
>> ./Source/WebCore/accessibility/AccessibilityObject.h:35,
>> |                  from
>> ./Source/WebCore/accessibility/AXObjectCache.h:29,
>> |                  from ./Source/WebCore/page/ChromeClient.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.cpp:26:
>> | ./Source/WebCore/dom/EventListenerMap.h:94:5: error:
>> 'EventListener_3_6' does not name a type
>> | In file included from ./Source/WebCore/dom/Node.h:29:0,
>> |                  from ./Source/WebCore/editing/VisiblePosition.h:30,
>> |                  from
>> ./Source/WebCore/accessibility/AccessibilityObject.h:35,
>> |                  from
>> ./Source/WebCore/accessibility/AXObjectCache.h:29,
>> |                  from ./Source/WebCore/page/ChromeClient.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.cpp:26:
>> | ./Source/WebCore/dom/EventTarget.h: In member function 'void
>> WebCore::EventTarget::visitJSEventListeners(JSC::SlotVisitor&)':
>> | ./Source/WebCore/dom/EventTarget.h:190:51: error: 'class
>> WebCore::EventListenerIterator' has no member named 'nextListener'
>> | ./Source/WebCore/dom/EventTarget.h:191:21: error: invalid use of
>> incomplete type 'class WebCore::EventListener_3_6'
>> | In file included from ./Source/WebCore/dom/Node.h:29:0,
>> |                  from ./Source/WebCore/editing/VisiblePosition.h:30,
>> |                  from
>> ./Source/WebCore/accessibility/AccessibilityObject.h:35,
>> |                  from
>> ./Source/WebCore/accessibility/AXObjectCache.h:29,
>> |                  from ./Source/WebCore/page/ChromeClient.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.h:24,
>> |                  from
>> Source/WebKit/gtk/WebCoreSupport/ChromeClientGtk.cpp:26:
>> | ./Source/WebCore/dom/EventTarget.h:48:11: error: forward declaration
>> of 'class WebCore::EventListener_3_6'
>
> Not sure what exactly is happening.
>
> Please look into this.
>
> Thanks
>      Sau!
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../icu/files/icu-add-pkgconfig-support.patch      |   43
>> ++++++++++++++++++++
>>   meta/recipes-support/icu/icu-3.6.inc               |   11 +++++
>>   meta/recipes-support/icu/icu_3.6.bb                |    2 +-
>>   3 files changed, 55 insertions(+), 1 deletion(-)
>>   create mode 100644
>> meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>>
>> diff --git
>> a/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>> b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>> new file mode 100644
>> index 0000000..c7cd9d5
>> --- /dev/null
>> +++ b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>> @@ -0,0 +1,43 @@
>> +Upstream-Status: Inappropriate [version]
>> +ICU-3.6 has no pkgconfig, so I add it here.
>> +But ICU has had pkgconfig support since 4.6.
>> +So this patch is inappropriate to upstream.
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +
>> +Index: configure.in
>> +=============================================================
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -1057,4 +1057,7 @@ echo "This may cause ICU to fail to build.
>> Please make sure that GNU make"
>> + echo "is in your PATH so that this configure script can detect its
>> location."
>> + fi
>> +
>> ++AC_CONFIG_FILES([icu.pc])
>> ++AC_OUTPUT
>> ++
>> + $as_unset _CXX_CXXSUFFIX
>> +
>> +Index: icu.pc.in
>> +=============================================================
>> +--- /dev/null
>> ++++ b/icu.pc.in
>> +@@ -0,0 +1,15 @@
>> ++# Process this file with autoconf to produce a pkg-config metadata
>> file.
>> ++
>> ++prefix=@prefix@
>> ++exec_prefix=@exec_prefix@
>> ++libdir=@libdir@
>> ++includedir=@includedir@
>> ++unicode_version=@UNICODE_VERSION@
>> ++
>> ++Name: ICU
>> ++Description: International Component for Unicode libraries
>> ++Requires:
>> ++Version: @VERSION@
>> ++Libs: -L${libdir} -licui18n -licuuc -licudata
>> ++Libs.private: -L{libdir} -lpthread -lm
>> ++Cflags: -I${includedir} -O2 -pipe -g -feliminate-unused-debug-types
>> +--
>> +1.7.11.2
>> +
>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>> b/meta/recipes-support/icu/icu-3.6.inc
>> index 272f6d1..8caf71c 100644
>> --- a/meta/recipes-support/icu/icu-3.6.inc
>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>> @@ -7,6 +7,7 @@ BASE_SRC_URI =
>> "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-
>>              file://fix-parallel-build.patch \
>>              file://use-g++-for-linking.patch \
>>              file://larger-cmd-size.patch \
>> +       file://icu-add-pkgconfig-support.patch \
>>              "
>>   SRC_URI = "${BASE_SRC_URI} \
>>              file://noldlibpath.patch \
>> @@ -28,6 +29,12 @@ inherit autotools pkgconfig binconfig
>>   do_configure() {
>>       libtoolize --force
>>       gnu-configize --force
>> +    if [ "${PN}" != "icu-native" ]; then
>> +        OLD=`pwd`
>> +        cd ${S}
>> +        autoconf
>> +        cd ${OLD}
>> +    fi

I had some time this morning to investigate this more deeply.  What I 
found was that the ICU tarball was being delivered with a "configure" 
and that the do_configure was avoiding the "autoconf" conversion of 
configure.in -> configure.  I am not sure if this is historical or if 
this is truly needed.

So by doing the autoconf above you changed the "configure" script, this 
in turn caused some configuration changes to occur in the platform.h 
file.  Why these changed (particularly the U_HAVE_NAMESPACE define) then 
caused the ICU libraries to be built with different namespace.

So a couple of key questions that need to be resolved:
1) Will updating to 4.6 solve this issue, if not then we need to dive 
into 2 + 3 Below:

2) Why does icu tarball have a generated configure?

3) Why does the autoconf generated configure fail to configure things 
correctly?

Sau!


>>       oe_runconf
>>       if [ "${PN}" != "icu-native" ]; then
>>           # In the non-native case we need to make substitutions to use
>> @@ -45,6 +52,10 @@ do_compile() {
>>
>>   do_install_append() {
>>           chmod +x ${D}${libdir}/lib*
>> +    if [ "${PN}" != "icu-native" ]; then
>> +        install -d ${D}/${libdir}/pkgconfig
>> +            install -m 0644 ${S}/icu.pc ${D}/${libdir}/pkgconfig
>> +    fi
>>   }
>>
>>   PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx
>> libicutu libicuio"
>> diff --git a/meta/recipes-support/icu/icu_3.6.bb
>> b/meta/recipes-support/icu/icu_3.6.bb
>> index f941acf..f50abe2 100644
>> --- a/meta/recipes-support/icu/icu_3.6.bb
>> +++ b/meta/recipes-support/icu/icu_3.6.bb
>> @@ -1,6 +1,6 @@
>>   require icu-3.6.inc
>>
>> -PR = "r9"
>> +PR = "r10"
>>
>>   SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
>>   SRC_URI[sha256sum] =
>> "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE078C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 20:07:03 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.24454.1741896417360413301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 13:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id BC1B81110;
	Thu, 13 Mar 2025 21:06:35 +0100 (CET)
Received: from [192.168.178.20] ([79.219.231.110]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsop9-2756SO0; Thu, 13 Mar 2025 21:06:35 +0100
Date: Thu, 13 Mar 2025 21:07:05 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][gnome48][oe-core][PATCHv2 1/4] gtk4: update 4.16.2 ->
 4.17.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <TVV2TS.4R0QAVWO8Y9I2@t-online.de>
In-Reply-To: <CANNYZj9BULvYRVdmg87Nf33f_up_XHhs_7OPwSGQ__T19XDC2w@mail.gmail.com>
References: <20250313073436.5133-1-f_l_k@t-online.de>
	<CANNYZj9BULvYRVdmg87Nf33f_up_XHhs_7OPwSGQ__T19XDC2w@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oWRpFU1WWpRn/QNIeSgE"
X-TOI-EXPURGATEID: 150726::1741896395-D3FFD450-6A5CC735/0/0 CLEAN NORMAL
X-TOI-MSGID: 5bfc0116-babe-4590-9da5-af96db00390f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 20:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212806

--=-oWRpFU1WWpRn/QNIeSgE
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

Yes, they are. That's why I marked them as RFCs. I'll point that out=20
next time.

On Thu, Mar 13 2025 at 17:40:06 +01:00:00, Alexander Kanavin=20
<alex.kanavin@gmail.com> wrote:
> 4.17.x are pre-releases, right? You should acknowledge this in the
> commit message.
>=20
> Alex
>=20
> On Thu, 13 Mar 2025 at 08:34, Markus Volk via lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  Overview of Changes in 4.17.6, 04-03-2025
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  Note: The buffer sizing fixes in this release are known to
>>  not work with fractional scales on macOS. This will hopefully
>>  be fixed soon. In the meantime, you can use the cairo renderer.
>>=20
>>  * GSK rendering issues on Asahi Linux are fixed
>>=20
>>  * Buffer sizing issues with fractional scaling are fixed
>>=20
>>  * GtkFontChooser scrolls to the initially selected font
>>=20
>>  * Font rendering with the new default GNOME font is improved
>>=20
>>  * The Wayland cursor shape protocol is supported
>>=20
>>  * Initial focus for popups on Android is fixed
>>=20
>>  * Bugs fixed:
>>    - #3184 Application crashes when presenting popover menus=20
>> (Matthias Clasen)
>>    - #4019 Crash on ListBoxRow.get_index (Matthias Clasen)
>>    - #6455 GtkFlowBox aligns incorrectly with GTK_ALIGN_END and
>>      min/max_children_per_line (Gergo Koteles)
>>    - #6817 Null pointer dereference in gdk_surface_request_motion=20
>> (Matthias
>>      Clasen)
>>    - #7146 GSK issues illegal render ops with load=3Ddont-care and=20
>> blend=3Dover with
>>      Wayland fractional scaling, causing graphical corruption=20
>> (Benjamin Otte)
>>    - #7282 memorytexture testsuite fails the float tests (Benjamin=20
>> Otte)
>>    - #7314 Incorrect height calculations with fractional scaling=20
>> under vulkan
>>      renderer (violates vulkan validation layers) (Benjamin Otte)
>>    - #7369 GtkTextView does not claim all click gestures=20
>> (Maximiliano Sandoval)
>>    - #7370 activating `GDK_DEBUG=3DEVENTS` crashes the application if=20
>> a touch event
>>      occurs (Matthias Clasen)
>>    - #7384 Comment required for search string (Matthias Clasen)
>>    - !6617 Fix measuring label min wfh with wrap+ellipsize+lines
>>    - !6635 gtkmodelbutton: Always close submenus when changing=20
>> parent item
>>    - !7746 ci: Regenerate Fedora image from F41
>>    - !8028 fontchooser: scroll to selected font
>>    - !8111 macos: Re-enable macOS GIR generation
>>    - !8154 adjustment: Verify that values are finite
>>    - !8156 Clarify hide-on-close documentation
>>    - !8188 gdkkeys-win32: Add keymap=20
>> get_active_layout_index/get_layout_names
>>    - !8231 docs: Fix the missing image in the picture screenshots
>>    - !8232 gdk: Fix spelling for GdkAndroidDisplayNightMode enum=20
>> value nick
>>    - !8234 wayland: Update color coordinates for extra precision
>>    - !8235 Drop GskProfiler
>>    - !8241 macos: Do not occupy space for window buttons when full=20
>> screen
>>    - !8242 android: Update focus state on motion events for autohide=20
>> surfaces
>>    - !8243 gdk: Deprecate gdk_cairo_context_cairo_create()
>>    - !8246 cpdb: Update gtk_print_backend_cpdb_init for latest CPDB=20
>> version
>>    - !8247 wayland: Support the cursor-shape protocol
>>    - !8248 docs: Fix an image name
>>    - !8250 macos: Track number of button widgets realized on a window
>>    - !8251 wayland: Go back to the old none cursor
>>    - !8253 Bring back unhinted extents
>>    - !8256 wayland: Fix none cursor check
>>    - !8263 inspector: Show font options
>>    - !8264 Try again to fix font rendering
>>=20
>>  * Translation updates:
>>    - Basque (Asier Sarasua Garmendia)
>>    - Bulgarian (twlvnn kraftwerk, Alexander Shopov)
>>    - Catalan (Jordi Mas i Hernandez)
>>    - Chinese (China) (Luming Zh)
>>    - Czech (Daniel Rusek)
>>    - Finnish (Jiri Gr=C3=B6nroos)
>>    - Galician (Fran Dieguez)
>>    - Georgian (Ekaterine Papava)
>>    - Hebrew (Yosef Or Boczko)
>>    - Indonesian (Andika Triwidada)
>>    - Korean (Changwoo Ryu)
>>    - Lithuanian (Aurimas =C4=8Cernius)
>>    - Persian (Danial Behzadi)
>>    - Polish (Piotr Dr=C4=85g)
>>    - Portuguese (Hugo Carvalho)
>>    - Portuguese (Brazil) (Rafael Fontenelle)
>>    - Slovenian (Martin)
>>    - Spanish (Daniel Mustieles)
>>    - Turkish (Sabri =C3=9Cnal)
>>    - Ukrainian (Yuri Chornoivan)
>>=20
>>  Overview of Changes in 4.17.5, 23-02-2025
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * Numeric mode in GtkSpinButtons works again
>>=20
>>  * Client-side dialogs can be made fully modal
>>=20
>>  * Portals work better for unsandboxed apps, by registering
>>=20
>>  * Editable labels have a context menu
>>=20
>>  * GtkListBox size allocation has been improved
>>=20
>>  * We require wayland 1.23 and wayland-protocols 1.41
>>=20
>>  * We use the wp_color_manager_v1 protocol for color management=20
>> under Wayland
>>=20
>>  * Most screenshots in the documentation have a dark variant
>>=20
>>  * GtkBuilder allows inline definition for GMenu-valued properties
>>=20
>>  * Headerbars can use native window controls on macOS
>>=20
>>  * Bugs fixed:
>>    - #4353 Keyboard: Set shortcut does not work for key-codes > 247=20
>> (Matthias
>>      Clasen)
>>    - #5125 Demo / Menu: Popup at wrong position, hangs on Wayland=20
>> (Matthias
>>      Clasen)
>>    - #5815 builder: integrate menus more properly (Matthias Clasen)
>>    - #6010 gtk4-demo > Lists > Selections emits CRITICALS (Matthias=20
>> Clasen)
>>    - #6272 a11y: API for updating platform state for custom=20
>> GtkAccessible
>>      implementations is missing (Emmanuele Bassi)
>>    - #6355 gtk_widget_compute_transform() not working correctly with=20
>> GtkPopover
>>      (Alessandro Astone)
>>    - #6379 GtkListBox crashes if the placeholder is focused and then=20
>> TAB is
>>      pressed
>>    - #7191 Have a way to block parent shortcuts in AdwDialog=20
>> (Matthias Clasen)
>>    - #7215 Changing the click behavior of Gtk.EditableLabel=20
>> (Matthias Clasen)
>>    - #7229 GSK/vulkan uses mipmaps without checking the=20
>> formats/tiling
>>      `VkImageFormatProperties.maxMipLevels` (Janne Grunau)
>>    - #7249 Cursor hotspot and cursor image are not updated=20
>> atomically on Wayland
>>      (Carlos Garnacho)
>>    - #7257 Unexpected spacing at the end of a textview when using=20
>> child widgets.
>>      (Sergey Bugaev)
>>    - #7286 GtkApplicationWindow show-menubar documentation=20
>> inconsistent
>>    - #7307 GtkAppChooserWidget doesn't fit in a mobile screen=20
>> (Automeris naranja)
>>    - #7310 Inspector showing child widgets & controllers twice=20
>> (Florian
>>      "sp1rit")
>>    - #7311 GtkSpinButton:numeric=3DTrue doesn't work (Matthias Clasen)
>>    - #7312 Dead link in common questions
>>    - #7321 mem leak in emoji chooser (Matthias Clasen)
>>    - #7322 invalid array index use
>>    - #7324 Missing support for F17, F18, F19 and F20 keys on MacOS=20
>> (Elisa Pau)
>>    - #7334 Gtk password inputs should expose the displayed text=20
>> (e.g. black
>>      circles) via AT-SPI; not the underlying value (Emmanuele Bassi)
>>    - #7340 Job Failed #4757144: Meson error
>>    - !7951 ListBox hacking
>>    - !8071 macos: Native window controls
>>    - !8073 gpu: Fix off-by-one error in gsk_vulkan_mipmap_levels
>>    - !8155 application: Register host apps with portal
>>    - !8177 Small Android fixes
>>    - !8178 Fix typo in `FileLauncher.set_always_ask` docs
>>    - !8179 gdk/wayland: Use forgotten include guards
>>    - !8180 docs: fix some typos, mainly closing ticks
>>    - !8184 android: Provide Gdk.FOCUS_CHANGE events
>>    - !8187 demos: Fix gettext domain in metainfo
>>    - !8195 gtk-demo: Tweak the fixed demo
>>    - !8196 settings: Fix GdkDisplay values ignored at init
>>    - !8197 popovermenubar: Do not steal the focus on hover
>>    - !8198 gi: Add missing annotation to=20
>> WaylandSurface.force_next_commit
>>    - !8200 rendernode: Add fixed-size annotations
>>    - !8201 fontdialogbutton: Gracefully handle unknown font
>>    - !8205 Update getting_started.md - point to Gtk.Widget.present=20
>> instead of
>>      show
>>    - !8206 docs: Fix 'Title overline too short' error
>>    - !8207 Update getting_started for=20
>> gdk_surface_create_similar_surface
>>      depreaction
>>    - !8208 a11y: Fix issues in text attribute run logic
>>    - !8210 gdk: Small documentation improvements
>>    - !8211 wayland: Use the wp_color_manager_v1 protocol
>>    - !8217 macos: Disable animations if setting "Reduce Motion" is=20
>> active
>>    - !8219 application: Clean up dangling inhibitor surface
>>    - !8221 gtk-demo: Improve colors of triangle in GLArea demo
>>    - !8222 vulkan: Fix max amount of modifiers per format
>>    - !8223 docs: Add dark variants to widget gallery
>>    - !8224 docs: Fix gallery images for menus
>>    - !8228 gsk: Don't color-convert empty surfaces
>>    - !8229 gdk: Remove GDK_DEBUG=3Dgl-no-fractional
>>=20
>>  * Translation updates:
>>    - Catalan (Jordi Mas)
>>    - Chinese (Taiwan) (Chao-Hsiung Liao)
>>    - French (Vincent Chatelain)
>>    - Georgian (Ekaterine Papava)
>>    - Nepali (Pawan Chitrakar)
>>    - Persian (Danial Behzadi)
>>    - Polish (Piotr Dr=C4=85g)
>>    - Slovenian (Martin)
>>=20
>>  Overview of Changes in 4.17.4, 01-02-2025
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  This release introduces a new backend, which allows running
>>  GTK applications on Android phones. It is still considered
>>  experimental. Feedback and improvements are welcome!
>>=20
>>  We have a ci job that produces signed apks for gtk4-demo,
>>  to make it easy to try this out.
>>=20
>>  * GtkFileChooser:
>>   - Stop replacing : (colon) with U+2236 (ratio)
>>=20
>>  * GtkSpinButton:
>>   - Avoid out-of-bounds values in some cases
>>=20
>>  * GtkWindow:
>>   - Send expected a11y events when a window is closed
>>   - Change accessible role back to GTK_ACCESSIBLE_ROLE_WINDOW
>>=20
>>  * GtkLabel:
>>   - Make context menus keyboard-navigatable
>>=20
>>  * GtkVideo:
>>   - Support rotated videos
>>=20
>>  * GDK:
>>   - Add a way to retrieve keyboard layout information
>>   - Use libpng api for cicp if available
>>=20
>>  * GSK
>>   - Drop the old GL renderer
>>=20
>>  * Accessibility:
>>   - Maintain inverse relations
>>=20
>>  * macOS:
>>   - Enable AccessKit in ci
>>   - Fix inverted pen tilt
>>=20
>>  * Deprecations:
>>   - The x11 backend
>>   - The Broadway backend
>>=20
>>  * Build:
>>   - Require cairo 1.18.2
>>=20
>>  * Bugs fixed:
>>    - #6755 Accessible `window:activate` events missing for Gtk4=20
>> (Matthias Clasen)
>>    - #6823 Enumeration values starting with numbers (Matthias Clasen)
>>    - #7210 ci: Build with -Daccesskit=3Denabled on macOS
>>    - #7228 gtk4-demo settings demo does not actually write settings=20
>> (Matthias
>>      Clasen)
>>    - #7246 Cannot navigate context menu of GtkLabel with keyboard
>>    - #7268 RFC: API to query the current keyboard layout ?
>>    - #7271 Test failures with libpng-1.6.45 (Alessandro Astone)
>>    - #7279 GTKFileChooserWidget incorrectly displays "Modified" time=20
>> of file when
>>      format should be "%H:%M" (Matthias Clasen)
>>    - #7294 Hovering buttons causes "g_object_unref: assertion=20
>> 'G_IS_OBJECT
>>      (object)' failed" (Matthias Clasen)
>>    - !7555 Introducing new android backend
>>    - !8017 gdk: fix crash on Wayland with already destroyed surface.
>>    - !8060 Deprecate the X11 backend
>>    - !8115 Introduce the label for relation and the concept of=20
>> reverse relations
>>    - !8118 Prepare the 4.17.3 release
>>    - !8119 Post-release version bump
>>    - !8121 vulkan: Handle VK_PRESENT_MODE_FIFO_LATEST_READY_EXT
>>    - !8124 Fix the archive URL for Boost
>>    - !8126 docs: Mark GtkShortcutsWindow as deprecated
>>    - !8127 tools: Drop support for the gl renderer
>>    - !8128 spinbutton: Consider adjustment value sanitization
>>    - !8129 Drop test exclusions for the gl renderer
>>    - !8133 ci: Move subproject download and update over to a=20
>> separate job
>>    - !8134 Keep installing gsk/gl/gskglrenderer.h
>>    - !8137 gtktextattributes and gtkaccessible copy-paste errors
>>    - !8138 gtk-demo: Plug a memory leak
>>    - !8139 window: Hide accessible earlier
>>    - !8140 Keep installing gsk/gl/gskglrenderer.h
>>    - !8142 gtk4-builder-tool: Plug a few memory leaks
>>    - !8144 macos: fix broken accounting messages and click after=20
>> moving the
>>      window
>>    - !8147 Docs: Small fixes
>>    - !8148 text: Correct the documentation
>>    - !8150 Avoid using deprecated GtkWindow::keys-changed internally
>>    - !8151 gstreamer: Implement rotation tag support
>>    - !8157 gstreamer: Improve rotation tag support
>>    - !8160 docs: Don't recommend usage of deprecated ToggleButton=20
>> method
>>    - !8163 gdk/contentserializer: Force specific URI schemes to=20
>> serialize as URI
>>    - !8164 gdk/wayland: Ensure to generate grab broken events before=20
>> crossings
>>    - !8166 filedialog: fix typo in docs
>>    - !8167 macos: Gtk4: Fix inverted pen Y tilt on macOS
>>=20
>>  * Translation updates:
>>    - Slovenian (Martin)
>>    - Thai (Aefgh Threenine)
>>=20
>>  Overview of Changes in 4.17.3, 16-01-2025
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * GtkText:
>>   - Consume Ctrl-A
>>   - Handle Cut', Copy, Paste, Undo, and Redo keys
>>   - Improve a11y representation
>>=20
>>  * GtkLabel:
>>   - Consume Ctrl-A when we handle it
>>   - Pass mnemonics to a11y
>>=20
>>  * GtkTextView:
>>   - Handle Cut, Copy, Paste, Undo, and Redo keys
>>   - Fix disappearing carets after focus changes
>>=20
>>  * GtkFileChooser:
>>   - Handle Find keys
>>   - Set a11y label on Search button
>>   - Set a11y labels on pathbar buttons
>>   - Pass key-shortcuts for the "New folder" button
>>=20
>>  * GtkAppChooser:
>>   - Fix sorting
>>=20
>>  * GtkListBox:
>>   - Improve a11y representation
>>=20
>>  * GtkColumnView:
>>   - Fix column dnd in right-to-left context
>>=20
>>  * GtkWindow:
>>   - Make resize corners gapless with rounded corners
>>=20
>>  * GtkPopoverMenu:
>>   - Show mnemonics on Alt press
>>=20
>>  * GtkMenuButton:
>>   - Improve a11y representation
>>=20
>>  * GtkFileDialog:
>>   - Fix a crash
>>   - Add more text file api variants
>>=20
>>  * GtkSizeGroup:
>>   - Improve consistency measurements and allocations
>>=20
>>  * GtkBuilder:
>>   - Parse tab arrays and font descriptions in Pango syntax
>>=20
>>  * Wayland:
>>   - Rely on scale events for pointer surfaces
>>   - Make idle inhibit work with fullscreen subsurfaces
>>=20
>>  * Accessibility:
>>   - Implement GetKeyBinding properly for actions
>>   - Set key-shortcuts attribute
>>   - Fix state change notification for some states
>>   - Set application ID attribute
>>=20
>>  * MacOS:
>>   - Make the NGL renderer work again
>>=20
>>  * GSK:
>>   - Don't double-clip edges for shadows
>>=20
>>  * Demos:
>>   - widget-factory: Set alternative text on pictures
>>   - gtk-demo: Allow to run as a service
>>=20
>>  * Deprecations:
>>   - GtkShortcutsWindow
>>   - Loading themes from ~/.themes
>>   - <child> in ui files where child properties exist
>>=20
>>  * Translation updates:
>>   Brazilian Portuguese
>>   Georgian
>>   Turkish
>>=20
>>  Overview of Changes in 4.17.2, 26-12-2024
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * GtkWindow:
>>   - Rework computing the minimum size
>>=20
>>  * GtkPicture:
>>   - Fix measuring with content-fit =3D scale-down
>>=20
>>  * GtkStack:
>>   - Report constant size request mode in more cases
>>   - Avoid measuring children aginst preferred request mode
>>   - Fix measuring during size interpolation
>>=20
>>  * GtkFlowBox:
>>   - Improve size request mode reporting
>>   - Fix measuring minimum height
>>   - Fix measuring natural width
>>   - Implement hfw vai binary search
>>=20
>>  * GtkScrolledWindow:
>>   - Report constant size request mode in more cases
>>   - Skip measuring children if we can
>>=20
>>  * GtkBox:
>>   - Don't always reserve height for baseline alignment
>>   - Rework natural opposite size-for-size computation
>>   - Add fast paths for some cases of measurement and allocation
>>=20
>>  * GtkLayoutManager:
>>   - Skip invisible children for request mode determination
>>   - Prefer hfw, all things being equal
>>=20
>>  * GtkColorPicker:
>>   - Respect GDK_DEBUG=3Dno-portals
>>=20
>>  * GtkEntry:
>>   - Stop guessing text direction from keyboard layout
>>   - Add a shortcut and context menu item to change text direction
>>=20
>>  * GtkSpinButton:
>>   - Make numeric spin buttons always LTR
>>=20
>>  * GtkAboutDialog:
>>   - Small UI improvements
>>=20
>>  * Accessibility:
>>   - Add an AccessKit backend. Use -Daccesskit=3Denabled to build it
>>     and GTK_A11Y=3Daccesskit to use it
>>=20
>>  * Windows:
>>   - Drop the AeroSnap emulation
>>=20
>>  * Wayland:
>>   - Always clear exported surface IDs on finalize
>>   - Use the correct display for imcontext
>>=20
>>  * Vulkan:
>>   - Make GdkVulkanContext work with Android armv7
>>=20
>>  * Build:
>>   - Require GLib 2.80
>>   - Require harfbuzz 8.4
>>   - Require pango 1.55
>>   - Require C11
>>=20
>>  * Translation update:
>>   Russian
>>=20
>>  Overview of Changes in 4.17.1, 06-12-2024
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  This release switches our portal support from opt-in to opt-out.
>>  We will use portals by default, unless you set GDK_DEBUG=3Dno-portals.
>>  And we will *always* use portals in flatpaks.
>>=20
>>  * Text rendering:
>>   - Make error underlines smaller
>>=20
>>  * GtkText:
>>   - Avoid selecting inserted Emoji
>>=20
>>  * GtkPlacesView:
>>   - Improve accessibility
>>=20
>>  * GtkFileChooser:
>>   - Fix a case where search was stealing focus
>>=20
>>  * GtkEmojiChooser:
>>   - Update to CLDR 46 / Unicode 16
>>=20
>>  * Accessibility:
>>   - Fix DBus signature of ChildrenChanged
>>=20
>>  * GDK:
>>   - Don't recycle threads too aggressively
>>   - Add GDK_DISABLE=3Dthreads to disable threaded operations
>>   - Improve parallelization for small tasks
>>=20
>>  * GSK:
>>   - Make occlusion checking more effective
>>   - Clip luminosity when clipping colors (avoiding masking artifacts)
>>   - Fix problems with dihedral transforms
>>=20
>>  * Vulkan:
>>   - Streamline Vulkan setup
>>   - Fix blurry rendering at certain scale/size combinations
>>=20
>>  * OpenGL:
>>   - Conform to buffer offset alignment requirements
>>=20
>>  * Windows:
>>   - Fix pasting certain bitmaps
>>=20
>>  * Documentation:
>>   - Revise and modernize some docs
>>=20
>>  * Debugging:
>>   - Inspector: Show surfaces and renderers in the tree
>>   - Inspector: Make the object tree resizable
>>   - Inspector: Add a "Copy for gitlab" button
>>=20
>>  * Translation updates
>>   Icelandic
>>   Serbian
>>   Slovenian
>>=20
>>  Overview of Changes in 4.17.0, 06-11-2024
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * GtkScrolledWindow
>>   - Fix criticals in size allocation code
>>=20
>>  * GtkFileChooser
>>   - Fix a crash in the portal code
>>=20
>>  * GtkFontChoser
>>   - Make the dialog more shrinkable
>>=20
>>  * GtkPicture
>>   - Avoid unnecessary resizes
>>=20
>>  * GtkVideo
>>   - Make dmabufs work without GL
>>=20
>>  * GtkListBox:
>>   - Add a tab-behavior property to influence keynav
>>=20
>>  * GtkEmojiChooser:
>>   - Fix problems with insertion and selection
>>=20
>>  * GtkStringList:
>>   - Add gtk_string_list_find
>>=20
>>  * GtkApplication:
>>   - Respect GDK_DEBUG=3Dno-portals
>>   - Set default window icon from app ID
>>=20
>>  * GtkTextView:
>>   - Vertical and horizontal positioning of the textview is now=20
>> quantized
>>     to the nearest device pixel. This should improve the perceived=20
>> smoothness
>>     of scrolling with fractional scaling and font hinting.
>>   - Incorrect re-use of cached styling was fixed
>>   - Fix some missing CSS invalidation
>>   - Handle charsets in clipboard datatypes
>>=20
>>  * Printing:
>>   - Avoid warnings for avahi errors
>>   - Fix a segfault in the print dialog setup code
>>=20
>>  * Accessibility:
>>   - Always realize non-widget accessibles, to help webkit
>>   - Fix list view selection implementation
>>   - Handle NULL values in more places
>>=20
>>  * Gstreamer:
>>   - Make dmabufs works without GL
>>=20
>>  * Gdk:
>>   - Add OKLAB and OKLCH color states
>>   - GL: Drop support for GLES 2 and GL < 3.3
>>   - GL: Use the ngl dmabuf downloader instead of the GL downloader
>>   - Vulkan: Drop the GDK_VULKAN_DEVICE env var. Use=20
>> MESA_VK_DEVICE_SELECT instead
>>   - Vulkan: Use the swapchain maintenance extension to release swap=20
>> images
>>   - Forbid opening displays before gtk_init()
>>=20
>>  * Gsk:
>>   - Many improvements to the dmabuf downloaders
>>   - ngl: Avoid glBufferSubData for globals, speeding up llvmpipe
>>   - Renderer selection will no longer consider the GL renderer
>>   - Allow Vulkan software rendering as fallback
>>   - Support gradient interpolation in different color states
>>=20
>>  * Wayland:
>>   - Improve settings portal handling
>>   - Improve fallback for cursor themes
>>   - Make cursor theme changes apply immediately
>>   - Use a viewporter for cursor image scaling
>>   - Improve cursor size handling
>>   - Use the system bell protocol if available
>>   - Fix possible deadlock with high-priority sources triggering=20
>> roundtrips
>>=20
>>  * Windows:
>>   - Improve the backend code
>>   - Fix some problems with WGL on NVidia
>>   - Many testsuite fixes for Windows compatibility
>>   - Make all pixbuf loaders builtin in the gdk-pixbuf subproject
>>   - Add GDK_DISABLE=3Daerosnap to disable aerosnap
>>   - Improve clipboard handling
>>   - Fix behavior or gdk_display_open() on Windows
>>   - Numerous papercut fixes
>>   - Require Windows 10
>>=20
>>  * Macos:
>>   - Fix crashes when dragging libadwaita TabView tabs
>>   - Require macOS 10.15
>>=20
>>  * Tools and demos
>>   - gtk4-demo: Make demos standalone
>>   - gtk4-demo: Drop GL shader demos
>>   - gtk4-demo: Improve scrolling benchmarks
>>   - gtk4-builder-tool: Improve separator handling
>>   - gtk4-image-tool: Better color state support
>>=20
>>  * Build:
>>   - Don't set GSK_RENDERER in our flatpaks
>>   - Require meson 1.2
>>=20
>>  * Translation updates
>>   Belarusian
>>   Brazilian Portuguese
>>   British English
>>   Galician
>>   Lithuanian
>>   Romanian
>>   Slovenian
>>   Swedish
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta/recipes-gnome/gtk+/{gtk4_4.16.12.bb =3D> gtk4_4.17.6.bb} | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta/recipes-gnome/gtk+/{gtk4_4.16.12.bb =3D> gtk4_4.17.6.bb}=20
>> (98%)
>>=20
>>  diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb=20
>> b/meta/recipes-gnome/gtk+/gtk4_4.17.6.bb
>>  similarity index 98%
>>  rename from meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
>>  rename to meta/recipes-gnome/gtk+/gtk4_4.17.6.bb
>>  index d8d37a526d..9e3ac729ca 100644
>>  --- a/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
>>  +++ b/meta/recipes-gnome/gtk+/gtk4_4.17.6.bb
>>  @@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>>   UPSTREAM_CHECK_REGEX =3D=20
>> "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
>>=20
>>   SRC_URI =3D=20
>> "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz=20
>> <http://ftp.gnome.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D=
.tar.xz>"
>>  -SRC_URI[sha256sum] =3D=20
>> "ef31bdbd6f082c4401634a20c850b0050c9bf252ef1e079764ee95a2a0c4c95a"
>>  +SRC_URI[sha256sum] =3D=20
>> "dfae9ba1263f84afa83a494db2ed14c7392c67840b6730bfa26eb79fde1e13a1"
>>=20
>>   S =3D "${WORKDIR}/gtk-${PV}"
>>=20
>>  --
>>  2.48.1
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#212742):=20
>> <https://lists.openembedded.org/g/openembedded-core/message/212742>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/111675689/1686489>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org=20
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
>> [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-oWRpFU1WWpRn/QNIeSgE
Content-Type: text/html; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><span class=3D"HwtZe" jsname=3D"jqKxS" =
jsaction=3D"mouseup:Sxi9L,BR6jm; mousedown:qjlr0e" lang=3D"en"><span jsname=
=3D"txFAF" class=3D"jCAhz ChMk0b" jsaction=3D"agoMJf:PFBcW;MZfLnc:P7O7bd;nt=
4Alf:pvnm0e,pfE8Hb,PFBcW;B01qod:dJXsye;H1e5u:iXtTIf;lYIUJf:hij5Wb" jscontro=
ller=3D"BiTO4b"><span class=3D"ryNqvb" jsname=3D"W297wb" jsaction=3D"click:=
PDNqTc,GFf3ac,qlVvte;contextmenu:Nqw7Te,QP7LD; mouseout:Nqw7Te; mouseover:P=
DNqTc,c2aHje">Yes, they are.</span></span> <span jsname=3D"txFAF" class=3D"=
jCAhz ChMk0b" jsaction=3D"agoMJf:PFBcW;MZfLnc:P7O7bd;nt4Alf:pvnm0e,pfE8Hb,P=
FBcW;B01qod:dJXsye;H1e5u:iXtTIf;lYIUJf:hij5Wb" jscontroller=3D"BiTO4b"><spa=
n class=3D"ryNqvb" jsname=3D"W297wb" jsaction=3D"click:PDNqTc,GFf3ac,qlVvte=
;contextmenu:Nqw7Te,QP7LD; mouseout:Nqw7Te; mouseover:PDNqTc,c2aHje">That's=
 why I marked them as RFCs.</span></span> <span jsname=3D"txFAF" class=3D"j=
CAhz ChMk0b" jsaction=3D"agoMJf:PFBcW;MZfLnc:P7O7bd;nt4Alf:pvnm0e,pfE8Hb,PF=
BcW;B01qod:dJXsye;H1e5u:iXtTIf;lYIUJf:hij5Wb" jscontroller=3D"BiTO4b"><span=
 class=3D"ryNqvb" jsname=3D"W297wb" jsaction=3D"click:PDNqTc,GFf3ac,qlVvte;=
contextmenu:Nqw7Te,QP7LD; mouseout:Nqw7Te; mouseover:PDNqTc,c2aHje">I'll po=
int that out next time.</span></span></span></div><div id=3D"geary-quote" d=
ir=3D"auto"><br>On Thu, Mar 13 2025 at 17:40:06 +01:00:00, Alexander Kanavi=
n &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><div c=
lass=3D"plaintext" style=3D"white-space: break-spaces;">4.17.x are pre-rele=
ases, right? You should acknowledge this in the
commit message.

Alex

On Thu, 13 Mar 2025 at 08:34, Markus Volk via lists.openembedded.org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 Overview of Changes in 4.17.6, 04-03-2025
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 Note: The buffer sizing fixes in this release are known to
 not work with fractional scales on macOS. This will hopefully
 be fixed soon. In the meantime, you can use the cairo renderer.

 * GSK rendering issues on Asahi Linux are fixed

 * Buffer sizing issues with fractional scaling are fixed

 * GtkFontChooser scrolls to the initially selected font

 * Font rendering with the new default GNOME font is improved

 * The Wayland cursor shape protocol is supported

 * Initial focus for popups on Android is fixed

 * Bugs fixed:
   - #3184 Application crashes when presenting popover menus (Matthias Clas=
en)
   - #4019 Crash on ListBoxRow.get_index (Matthias Clasen)
   - #6455 GtkFlowBox aligns incorrectly with GTK_ALIGN_END and
     min/max_children_per_line (Gergo Koteles)
   - #6817 Null pointer dereference in gdk_surface_request_motion (Matthias
     Clasen)
   - #7146 GSK issues illegal render ops with load=3Ddont-care and blend=3D=
over with
     Wayland fractional scaling, causing graphical corruption (Benjamin Ott=
e)
   - #7282 memorytexture testsuite fails the float tests (Benjamin Otte)
   - #7314 Incorrect height calculations with fractional scaling under vulk=
an
     renderer (violates vulkan validation layers) (Benjamin Otte)
   - #7369 GtkTextView does not claim all click gestures (Maximiliano Sando=
val)
   - #7370 activating `GDK_DEBUG=3DEVENTS` crashes the application if a tou=
ch event
     occurs (Matthias Clasen)
   - #7384 Comment required for search string (Matthias Clasen)
   - !6617 Fix measuring label min wfh with wrap+ellipsize+lines
   - !6635 gtkmodelbutton: Always close submenus when changing parent item
   - !7746 ci: Regenerate Fedora image from F41
   - !8028 fontchooser: scroll to selected font
   - !8111 macos: Re-enable macOS GIR generation
   - !8154 adjustment: Verify that values are finite
   - !8156 Clarify hide-on-close documentation
   - !8188 gdkkeys-win32: Add keymap get_active_layout_index/get_layout_nam=
es
   - !8231 docs: Fix the missing image in the picture screenshots
   - !8232 gdk: Fix spelling for GdkAndroidDisplayNightMode enum value nick
   - !8234 wayland: Update color coordinates for extra precision
   - !8235 Drop GskProfiler
   - !8241 macos: Do not occupy space for window buttons when full screen
   - !8242 android: Update focus state on motion events for autohide surfac=
es
   - !8243 gdk: Deprecate gdk_cairo_context_cairo_create()
   - !8246 cpdb: Update gtk_print_backend_cpdb_init for latest CPDB version
   - !8247 wayland: Support the cursor-shape protocol
   - !8248 docs: Fix an image name
   - !8250 macos: Track number of button widgets realized on a window
   - !8251 wayland: Go back to the old none cursor
   - !8253 Bring back unhinted extents
   - !8256 wayland: Fix none cursor check
   - !8263 inspector: Show font options
   - !8264 Try again to fix font rendering

 * Translation updates:
   - Basque (Asier Sarasua Garmendia)
   - Bulgarian (twlvnn kraftwerk, Alexander Shopov)
   - Catalan (Jordi Mas i Hernandez)
   - Chinese (China) (Luming Zh)
   - Czech (Daniel Rusek)
   - Finnish (Jiri Gr=C3=B6nroos)
   - Galician (Fran Dieguez)
   - Georgian (Ekaterine Papava)
   - Hebrew (Yosef Or Boczko)
   - Indonesian (Andika Triwidada)
   - Korean (Changwoo Ryu)
   - Lithuanian (Aurimas =C4=8Cernius)
   - Persian (Danial Behzadi)
   - Polish (Piotr Dr=C4=85g)
   - Portuguese (Hugo Carvalho)
   - Portuguese (Brazil) (Rafael Fontenelle)
   - Slovenian (Martin)
   - Spanish (Daniel Mustieles)
   - Turkish (Sabri =C3=9Cnal)
   - Ukrainian (Yuri Chornoivan)

 Overview of Changes in 4.17.5, 23-02-2025
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Numeric mode in GtkSpinButtons works again

 * Client-side dialogs can be made fully modal

 * Portals work better for unsandboxed apps, by registering

 * Editable labels have a context menu

 * GtkListBox size allocation has been improved

 * We require wayland 1.23 and wayland-protocols 1.41

 * We use the wp_color_manager_v1 protocol for color management under Wayla=
nd

 * Most screenshots in the documentation have a dark variant

 * GtkBuilder allows inline definition for GMenu-valued properties

 * Headerbars can use native window controls on macOS

 * Bugs fixed:
   - #4353 Keyboard: Set shortcut does not work for key-codes &gt; 247 (Mat=
thias
     Clasen)
   - #5125 Demo / Menu: Popup at wrong position, hangs on Wayland (Matthias
     Clasen)
   - #5815 builder: integrate menus more properly (Matthias Clasen)
   - #6010 gtk4-demo &gt; Lists &gt; Selections emits CRITICALS (Matthias C=
lasen)
   - #6272 a11y: API for updating platform state for custom GtkAccessible
     implementations is missing (Emmanuele Bassi)
   - #6355 gtk_widget_compute_transform() not working correctly with GtkPop=
over
     (Alessandro Astone)
   - #6379 GtkListBox crashes if the placeholder is focused and then TAB is
     pressed
   - #7191 Have a way to block parent shortcuts in AdwDialog (Matthias Clas=
en)
   - #7215 Changing the click behavior of Gtk.EditableLabel (Matthias Clase=
n)
   - #7229 GSK/vulkan uses mipmaps without checking the formats/tiling
     `VkImageFormatProperties.maxMipLevels` (Janne Grunau)
   - #7249 Cursor hotspot and cursor image are not updated atomically on Wa=
yland
     (Carlos Garnacho)
   - #7257 Unexpected spacing at the end of a textview when using child wid=
gets.
     (Sergey Bugaev)
   - #7286 GtkApplicationWindow show-menubar documentation inconsistent
   - #7307 GtkAppChooserWidget doesn't fit in a mobile screen (Automeris na=
ranja)
   - #7310 Inspector showing child widgets &amp; controllers twice (Florian
     "sp1rit")
   - #7311 GtkSpinButton:numeric=3DTrue doesn't work (Matthias Clasen)
   - #7312 Dead link in common questions
   - #7321 mem leak in emoji chooser (Matthias Clasen)
   - #7322 invalid array index use
   - #7324 Missing support for F17, F18, F19 and F20 keys on MacOS (Elisa P=
au)
   - #7334 Gtk password inputs should expose the displayed text (e.g. black
     circles) via AT-SPI; not the underlying value (Emmanuele Bassi)
   - #7340 Job Failed #4757144: Meson error
   - !7951 ListBox hacking
   - !8071 macos: Native window controls
   - !8073 gpu: Fix off-by-one error in gsk_vulkan_mipmap_levels
   - !8155 application: Register host apps with portal
   - !8177 Small Android fixes
   - !8178 Fix typo in `FileLauncher.set_always_ask` docs
   - !8179 gdk/wayland: Use forgotten include guards
   - !8180 docs: fix some typos, mainly closing ticks
   - !8184 android: Provide Gdk.FOCUS_CHANGE events
   - !8187 demos: Fix gettext domain in metainfo
   - !8195 gtk-demo: Tweak the fixed demo
   - !8196 settings: Fix GdkDisplay values ignored at init
   - !8197 popovermenubar: Do not steal the focus on hover
   - !8198 gi: Add missing annotation to WaylandSurface.force_next_commit
   - !8200 rendernode: Add fixed-size annotations
   - !8201 fontdialogbutton: Gracefully handle unknown font
   - !8205 Update getting_started.md - point to Gtk.Widget.present instead =
of
     show
   - !8206 docs: Fix 'Title overline too short' error
   - !8207 Update getting_started for gdk_surface_create_similar_surface
     depreaction
   - !8208 a11y: Fix issues in text attribute run logic
   - !8210 gdk: Small documentation improvements
   - !8211 wayland: Use the wp_color_manager_v1 protocol
   - !8217 macos: Disable animations if setting "Reduce Motion" is active
   - !8219 application: Clean up dangling inhibitor surface
   - !8221 gtk-demo: Improve colors of triangle in GLArea demo
   - !8222 vulkan: Fix max amount of modifiers per format
   - !8223 docs: Add dark variants to widget gallery
   - !8224 docs: Fix gallery images for menus
   - !8228 gsk: Don't color-convert empty surfaces
   - !8229 gdk: Remove GDK_DEBUG=3Dgl-no-fractional

 * Translation updates:
   - Catalan (Jordi Mas)
   - Chinese (Taiwan) (Chao-Hsiung Liao)
   - French (Vincent Chatelain)
   - Georgian (Ekaterine Papava)
   - Nepali (Pawan Chitrakar)
   - Persian (Danial Behzadi)
   - Polish (Piotr Dr=C4=85g)
   - Slovenian (Martin)

 Overview of Changes in 4.17.4, 01-02-2025
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 This release introduces a new backend, which allows running
 GTK applications on Android phones. It is still considered
 experimental. Feedback and improvements are welcome!

 We have a ci job that produces signed apks for gtk4-demo,
 to make it easy to try this out.

 * GtkFileChooser:
  - Stop replacing : (colon) with U+2236 (ratio)

 * GtkSpinButton:
  - Avoid out-of-bounds values in some cases

 * GtkWindow:
  - Send expected a11y events when a window is closed
  - Change accessible role back to GTK_ACCESSIBLE_ROLE_WINDOW

 * GtkLabel:
  - Make context menus keyboard-navigatable

 * GtkVideo:
  - Support rotated videos

 * GDK:
  - Add a way to retrieve keyboard layout information
  - Use libpng api for cicp if available

 * GSK
  - Drop the old GL renderer

 * Accessibility:
  - Maintain inverse relations

 * macOS:
  - Enable AccessKit in ci
  - Fix inverted pen tilt

 * Deprecations:
  - The x11 backend
  - The Broadway backend

 * Build:
  - Require cairo 1.18.2

 * Bugs fixed:
   - #6755 Accessible `window:activate` events missing for Gtk4 (Matthias C=
lasen)
   - #6823 Enumeration values starting with numbers (Matthias Clasen)
   - #7210 ci: Build with -Daccesskit=3Denabled on macOS
   - #7228 gtk4-demo settings demo does not actually write settings (Matthi=
as
     Clasen)
   - #7246 Cannot navigate context menu of GtkLabel with keyboard
   - #7268 RFC: API to query the current keyboard layout ?
   - #7271 Test failures with libpng-1.6.45 (Alessandro Astone)
   - #7279 GTKFileChooserWidget incorrectly displays "Modified" time of fil=
e when
     format should be "%H:%M" (Matthias Clasen)
   - #7294 Hovering buttons causes "g_object_unref: assertion 'G_IS_OBJECT
     (object)' failed" (Matthias Clasen)
   - !7555 Introducing new android backend
   - !8017 gdk: fix crash on Wayland with already destroyed surface.
   - !8060 Deprecate the X11 backend
   - !8115 Introduce the label for relation and the concept of reverse rela=
tions
   - !8118 Prepare the 4.17.3 release
   - !8119 Post-release version bump
   - !8121 vulkan: Handle VK_PRESENT_MODE_FIFO_LATEST_READY_EXT
   - !8124 Fix the archive URL for Boost
   - !8126 docs: Mark GtkShortcutsWindow as deprecated
   - !8127 tools: Drop support for the gl renderer
   - !8128 spinbutton: Consider adjustment value sanitization
   - !8129 Drop test exclusions for the gl renderer
   - !8133 ci: Move subproject download and update over to a separate job
   - !8134 Keep installing gsk/gl/gskglrenderer.h
   - !8137 gtktextattributes and gtkaccessible copy-paste errors
   - !8138 gtk-demo: Plug a memory leak
   - !8139 window: Hide accessible earlier
   - !8140 Keep installing gsk/gl/gskglrenderer.h
   - !8142 gtk4-builder-tool: Plug a few memory leaks
   - !8144 macos: fix broken accounting messages and click after moving the
     window
   - !8147 Docs: Small fixes
   - !8148 text: Correct the documentation
   - !8150 Avoid using deprecated GtkWindow::keys-changed internally
   - !8151 gstreamer: Implement rotation tag support
   - !8157 gstreamer: Improve rotation tag support
   - !8160 docs: Don't recommend usage of deprecated ToggleButton method
   - !8163 gdk/contentserializer: Force specific URI schemes to serialize a=
s URI
   - !8164 gdk/wayland: Ensure to generate grab broken events before crossi=
ngs
   - !8166 filedialog: fix typo in docs
   - !8167 macos: Gtk4: Fix inverted pen Y tilt on macOS

 * Translation updates:
   - Slovenian (Martin)
   - Thai (Aefgh Threenine)

 Overview of Changes in 4.17.3, 16-01-2025
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * GtkText:
  - Consume Ctrl-A
  - Handle Cut', Copy, Paste, Undo, and Redo keys
  - Improve a11y representation

 * GtkLabel:
  - Consume Ctrl-A when we handle it
  - Pass mnemonics to a11y

 * GtkTextView:
  - Handle Cut, Copy, Paste, Undo, and Redo keys
  - Fix disappearing carets after focus changes

 * GtkFileChooser:
  - Handle Find keys
  - Set a11y label on Search button
  - Set a11y labels on pathbar buttons
  - Pass key-shortcuts for the "New folder" button

 * GtkAppChooser:
  - Fix sorting

 * GtkListBox:
  - Improve a11y representation

 * GtkColumnView:
  - Fix column dnd in right-to-left context

 * GtkWindow:
  - Make resize corners gapless with rounded corners

 * GtkPopoverMenu:
  - Show mnemonics on Alt press

 * GtkMenuButton:
  - Improve a11y representation

 * GtkFileDialog:
  - Fix a crash
  - Add more text file api variants

 * GtkSizeGroup:
  - Improve consistency measurements and allocations

 * GtkBuilder:
  - Parse tab arrays and font descriptions in Pango syntax

 * Wayland:
  - Rely on scale events for pointer surfaces
  - Make idle inhibit work with fullscreen subsurfaces

 * Accessibility:
  - Implement GetKeyBinding properly for actions
  - Set key-shortcuts attribute
  - Fix state change notification for some states
  - Set application ID attribute

 * MacOS:
  - Make the NGL renderer work again

 * GSK:
  - Don't double-clip edges for shadows

 * Demos:
  - widget-factory: Set alternative text on pictures
  - gtk-demo: Allow to run as a service

 * Deprecations:
  - GtkShortcutsWindow
  - Loading themes from ~/.themes
  - &lt;child&gt; in ui files where child properties exist

 * Translation updates:
  Brazilian Portuguese
  Georgian
  Turkish

 Overview of Changes in 4.17.2, 26-12-2024
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * GtkWindow:
  - Rework computing the minimum size

 * GtkPicture:
  - Fix measuring with content-fit =3D scale-down

 * GtkStack:
  - Report constant size request mode in more cases
  - Avoid measuring children aginst preferred request mode
  - Fix measuring during size interpolation

 * GtkFlowBox:
  - Improve size request mode reporting
  - Fix measuring minimum height
  - Fix measuring natural width
  - Implement hfw vai binary search

 * GtkScrolledWindow:
  - Report constant size request mode in more cases
  - Skip measuring children if we can

 * GtkBox:
  - Don't always reserve height for baseline alignment
  - Rework natural opposite size-for-size computation
  - Add fast paths for some cases of measurement and allocation

 * GtkLayoutManager:
  - Skip invisible children for request mode determination
  - Prefer hfw, all things being equal

 * GtkColorPicker:
  - Respect GDK_DEBUG=3Dno-portals

 * GtkEntry:
  - Stop guessing text direction from keyboard layout
  - Add a shortcut and context menu item to change text direction

 * GtkSpinButton:
  - Make numeric spin buttons always LTR

 * GtkAboutDialog:
  - Small UI improvements

 * Accessibility:
  - Add an AccessKit backend. Use -Daccesskit=3Denabled to build it
    and GTK_A11Y=3Daccesskit to use it

 * Windows:
  - Drop the AeroSnap emulation

 * Wayland:
  - Always clear exported surface IDs on finalize
  - Use the correct display for imcontext

 * Vulkan:
  - Make GdkVulkanContext work with Android armv7

 * Build:
  - Require GLib 2.80
  - Require harfbuzz 8.4
  - Require pango 1.55
  - Require C11

 * Translation update:
  Russian

 Overview of Changes in 4.17.1, 06-12-2024
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 This release switches our portal support from opt-in to opt-out.
 We will use portals by default, unless you set GDK_DEBUG=3Dno-portals.
 And we will *always* use portals in flatpaks.

 * Text rendering:
  - Make error underlines smaller

 * GtkText:
  - Avoid selecting inserted Emoji

 * GtkPlacesView:
  - Improve accessibility

 * GtkFileChooser:
  - Fix a case where search was stealing focus

 * GtkEmojiChooser:
  - Update to CLDR 46 / Unicode 16

 * Accessibility:
  - Fix DBus signature of ChildrenChanged

 * GDK:
  - Don't recycle threads too aggressively
  - Add GDK_DISABLE=3Dthreads to disable threaded operations
  - Improve parallelization for small tasks

 * GSK:
  - Make occlusion checking more effective
  - Clip luminosity when clipping colors (avoiding masking artifacts)
  - Fix problems with dihedral transforms

 * Vulkan:
  - Streamline Vulkan setup
  - Fix blurry rendering at certain scale/size combinations

 * OpenGL:
  - Conform to buffer offset alignment requirements

 * Windows:
  - Fix pasting certain bitmaps

 * Documentation:
  - Revise and modernize some docs

 * Debugging:
  - Inspector: Show surfaces and renderers in the tree
  - Inspector: Make the object tree resizable
  - Inspector: Add a "Copy for gitlab" button

 * Translation updates
  Icelandic
  Serbian
  Slovenian

 Overview of Changes in 4.17.0, 06-11-2024
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * GtkScrolledWindow
  - Fix criticals in size allocation code

 * GtkFileChooser
  - Fix a crash in the portal code

 * GtkFontChoser
  - Make the dialog more shrinkable

 * GtkPicture
  - Avoid unnecessary resizes

 * GtkVideo
  - Make dmabufs work without GL

 * GtkListBox:
  - Add a tab-behavior property to influence keynav

 * GtkEmojiChooser:
  - Fix problems with insertion and selection

 * GtkStringList:
  - Add gtk_string_list_find

 * GtkApplication:
  - Respect GDK_DEBUG=3Dno-portals
  - Set default window icon from app ID

 * GtkTextView:
  - Vertical and horizontal positioning of the textview is now quantized
    to the nearest device pixel. This should improve the perceived smoothne=
ss
    of scrolling with fractional scaling and font hinting.
  - Incorrect re-use of cached styling was fixed
  - Fix some missing CSS invalidation
  - Handle charsets in clipboard datatypes

 * Printing:
  - Avoid warnings for avahi errors
  - Fix a segfault in the print dialog setup code

 * Accessibility:
  - Always realize non-widget accessibles, to help webkit
  - Fix list view selection implementation
  - Handle NULL values in more places

 * Gstreamer:
  - Make dmabufs works without GL

 * Gdk:
  - Add OKLAB and OKLCH color states
  - GL: Drop support for GLES 2 and GL &lt; 3.3
  - GL: Use the ngl dmabuf downloader instead of the GL downloader
  - Vulkan: Drop the GDK_VULKAN_DEVICE env var. Use MESA_VK_DEVICE_SELECT i=
nstead
  - Vulkan: Use the swapchain maintenance extension to release swap images
  - Forbid opening displays before gtk_init()

 * Gsk:
  - Many improvements to the dmabuf downloaders
  - ngl: Avoid glBufferSubData for globals, speeding up llvmpipe
  - Renderer selection will no longer consider the GL renderer
  - Allow Vulkan software rendering as fallback
  - Support gradient interpolation in different color states

 * Wayland:
  - Improve settings portal handling
  - Improve fallback for cursor themes
  - Make cursor theme changes apply immediately
  - Use a viewporter for cursor image scaling
  - Improve cursor size handling
  - Use the system bell protocol if available
  - Fix possible deadlock with high-priority sources triggering roundtrips

 * Windows:
  - Improve the backend code
  - Fix some problems with WGL on NVidia
  - Many testsuite fixes for Windows compatibility
  - Make all pixbuf loaders builtin in the gdk-pixbuf subproject
  - Add GDK_DISABLE=3Daerosnap to disable aerosnap
  - Improve clipboard handling
  - Fix behavior or gdk_display_open() on Windows
  - Numerous papercut fixes
  - Require Windows 10

 * Macos:
  - Fix crashes when dragging libadwaita TabView tabs
  - Require macOS 10.15

 * Tools and demos
  - gtk4-demo: Make demos standalone
  - gtk4-demo: Drop GL shader demos
  - gtk4-demo: Improve scrolling benchmarks
  - gtk4-builder-tool: Improve separator handling
  - gtk4-image-tool: Better color state support

 * Build:
  - Don't set GSK_RENDERER in our flatpaks
  - Require meson 1.2

 * Translation updates
  Belarusian
  Brazilian Portuguese
  British English
  Galician
  Lithuanian
  Romanian
  Slovenian
  Swedish

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  meta/recipes-gnome/gtk+/{gtk4_4.16.12.bb =3D&gt; gtk4_4.17.6.bb} | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
  rename meta/recipes-gnome/gtk+/{gtk4_4.16.12.bb =3D&gt; gtk4_4.17.6.bb} (=
98%)

 diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.17.6.bb
 similarity index 98%
 rename from meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
 rename to meta/recipes-gnome/gtk+/gtk4_4.17.6.bb
 index d8d37a526d..9e3ac729ca 100644
 --- a/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
 +++ b/meta/recipes-gnome/gtk+/gtk4_4.17.6.bb
 @@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
  UPSTREAM_CHECK_REGEX =3D "gtk-(?P&lt;pver&gt;\d+\.(\d*[02468])+(\.\d+)+)\=
.tar.xz"

  SRC_URI =3D "<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_=
VER}/gtk-${PV}.tar.xz">http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER=
}/gtk-${PV}.tar.xz</a>"
 -SRC_URI[sha256sum] =3D "ef31bdbd6f082c4401634a20c850b0050c9bf252ef1e07976=
4ee95a2a0c4c95a"
 +SRC_URI[sha256sum] =3D "dfae9ba1263f84afa83a494db2ed14c7392c67840b6730bfa=
26eb79fde1e13a1"

  S =3D "${WORKDIR}/gtk-${PV}"

 --
 2.48.1


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#212742): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/212742">https://lists.openembedded.org/g/openembed=
ded-core/message/212742</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111675689/16=
86489">https://lists.openembedded.org/mt/111675689/1686489</a>
 Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.=
org">openembedded-core+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-oWRpFU1WWpRn/QNIeSgE--


